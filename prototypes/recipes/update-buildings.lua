function array_push(source, push)
	local newArray = {}
	newArray[#newArray+1] = push
	for _, each in pairs(source) do
		newArray[#newArray+1] = each
	end
	return newArray
end

function addIng(source, item)
	if source.ingredients then
		source.ingredients[#source.ingredients+1] =  item
	end
	if source.normal then
		source.normal.ingredients[#source.normal.ingredients+1] = item
		source.expensive.ingredients[#source.expensive.ingredients+1] = item
		source.expensive.ingredients[#source.expensive.ingredients].amount = math.ceil(item.amount * 1.5)
	end
end
function calc_bm_ing(recipe)
	local ings
	if recipe.normal then
		ings = recipe.normal.ingredients
	else
		ings = recipe.ingredients
	end
	local total = 0
	for _,each in pairs(ings) do
		total = total + each.amount
	end
	return math.ceil(total * 0.25) --75% for component
end

local categories = {"accumulator", "beacon", "rocket-silo", "furnace", "generator", "lab", "mining-drill", "radar", "reactor", "solar-panel", "storage-tank", "assembling-machine", "boiler", }
--for each,_ in pairs(data.raw) do
--	log("cat: "..each)
--end
--other categories "pump", "offshore-pump", "roboport"

buildM.researcher.build_entity_list(categories)

--TODO
--Update this to utilize tiering system
--Create modified recipes--
for _,category in pairs(categories) do
	for rec_name,each in pairs(data.raw[category]) do
		local recipe = data.raw.recipe[buildM.researcher.getRecipeFor(rec_name)]
		if recipe and not buildM.updater.skipList[rec_name] and not string.find(recipe.name, "creative") then
			buildM.links.omni_standard(recipe)
			local tlvl = buildM.researcher.findTechLevel(recipe.name)
			local new_ings = {}
			local do_update = false
			if buildM.updater.use_components[rec_name] then
				component_base = buildM.updater.use_components[rec_name]
				tlvl = component_base.tier
				buildM.log("bm: using component recipe for "..rec_name.." at tier: "..tlvl)
				if not (tlvl == 0 and buildM.settings.burner_handling == "skip burner") then
					new_ings[1] = {type="item", name="building-materials-"..tlvl, amount=math.max(10*tlvl, 5)}
				end
				if component_base.material then
					new_ings[1].name = component_base.material
				end
				if tlvl > 0 then
					if component_base.uses_fluids then
						new_ings[#new_ings+1] = {type="item", name="building-cncsf-"..tlvl, amount=2*tlvl }
					else
						new_ings[#new_ings+1] = {type="item", name="building-cncs-"..tlvl, amount=2*tlvl }
					end
				end
				for compo,qty in pairs(component_base.components) do
					new_ings[#new_ings+1] = {type="item", name=compo, amount=qty}
				end
				if component_base.tier > 0 then
					recipe.category = "buildings-"..math.max(tlvl,1)
				end
				do_update = true
			elseif tlvl > 0 then
				--log("BM: basic recipe for: "..recipe.name)
				--log(serpent.block(recipe))
				--log("bm testing: "..recipe.name)
				local compo = buildM.generators.create_component_from_recipe(recipe.name, tlvl, buildM.researcher.getMainProduct_of(recipe))
				
				buildM.log("using generated component for: "..rec_name)
				local amounts = calc_bm_ing(recipe)
				new_ings[1] = {type="item", name="building-materials-"..tlvl, amount=amounts}
				new_ings[2] = {type="item", name="building-cncs-"..tlvl, amount=math.ceil(amounts*0.5) }
				new_ings[3] = {type="item", name=compo, amount=1}
				recipe.category = "buildings-"..math.max(tlvl,1)
				do_update = true
			elseif buildM.settings.burner_handling ~= "skip burner" then
				addIng(recipe, {type="item", name="building-materials-0", amount=5})
				buildM.updater.remove_entity_ings(recipe.normal.ingredients)
				buildM.updater.remove_entity_ings(recipe.expensive.ingredients)
			else
				--log("doing nothing with: "..recipe.name)
			end
			recipe.allow_decomposition = false
			if do_update then
				recipe.normal.ingredients = table.deepcopy(new_ings)
				recipe.normal.energy_required = (recipe.normal.energy_required or (recipe.energy_required or 5))
				recipe.expensive.ingredients = table.deepcopy(new_ings)
				recipe.expensive.energy_required = (recipe.expensive.energy_required or (recipe.energy_required or 5)* 1.5)
				for _,each in pairs(recipe.expensive.ingredients) do
					each.amount = math.ceil(each.amount * 1.5)
				end
				buildM.links.omni_compress_exclude(recipe.name)
			end
			--create deconstruct recipe
			local decon = {
				type = "recipe",
				name = recipe.name.."-decon",
				category = "building-decon",
				icons = {},
				icon_size = 32,
				normal = {
					ingredients = {
						{type="item", name = ((recipe.normal.results and recipe.normal.results[1].name) or recipe.normal.result), amount=1 },
					},
					energy = recipe.normal.energy,
					enabled = true,
					hidden = true,
					results = recipe.normal.ingredients,
					allow_decomposition = false,
				},
				expensive = {
					ingredients = {
						{type="item", name=((recipe.expensive.results and recipe.expensive.results[1].name) or recipe.expensive.result ), amount=1 },
					},
					energy = recipe.expensive.energy,
					enabled = true,
					hidden = true,
					results = recipe.expensive.ingredients,
					allow_decomposition = false
				},
				subgroup = (recipe.subgroup or "building-decons"),
				order = "zz-decon-"..(recipe.order or ""),
				hidden = true,
				allow_decomposition = false
			}
			if data.raw[category][rec_name].icons then
				for _,each in pairs(data.raw[category][rec_name].icons) do
					decon.icons[#decon.icons+1] = each
				end
			else
				decon.icons[#decon.icons+1] = { icon = data.raw[category][rec_name].icon }
			end
			decon.icons[#decon.icons+1] = { icon = "__Building_Materials__/graphics/icons/decon.png", shift = {-10, 5} }
			
			
			data:extend({decon})
		end
	end
end