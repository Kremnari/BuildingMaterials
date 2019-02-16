buildM.generators.create_precomposite = function(recipe_data)
	if not data.raw.item[recipe_data.item] then
		log("bm: attempted to create precomposite for "..recipe_data.item.." but it doesn't exist")
		return false
	end
	buildM.log("bm- adding precomposite based on "..recipe_data.item.." to tier: "..recipe_data.tier)
	local toAdd= {
		type = "recipe",
		name = recipe_data.item.."-building-components-"..recipe_data.tier,
		localised_name = {"item-name.precomposite", {"lookup.class-"..recipe_data.tier}, {"lookup.tier-focus-"..recipe_data.tier_focus[1]}, recipe_data.item, },
		category = "building-material-components-"..recipe_data.tier,
		icons = {
			{ icon = "__Building_Materials__/graphics/icons/component-"..recipe_data.tier_focus[1]..".png" },
			{ icon = "__Building_Materials__/graphics/icons/pallet-"..recipe_data.tier..".png" },
		},
		icon_size = 32,
		normal = {
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type="item", name=recipe_data.item, amount=recipe_data.base_qty },
			},
			results = {
				{ type="item", name="building-components-"..recipe_data.tier.."-"..recipe_data.tier_focus[1], amount_min=math.floor(recipe_data.base_qty/2), amount_max=recipe_data.base_qty },
				{ type="item", name="building-components-"..recipe_data.tier.."-"..recipe_data.tier_focus[2], probability=0.4, amount_min=math.floor(recipe_data.base_qty/4), amount_max=math.ceil(recipe_data.base_qty/2) },
				{ type="item", name="building-components-"..recipe_data.tier.."-"..recipe_data.tier_focus[3], probability=0.1, amount_min=1, amount_max=math.ceil(recipe_data.base_qty/4) },
			},
			allow_decomposition = false,
		},
		expensive = {
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type="item", name=recipe_data.item, amount=recipe_data.base_qty*2 },
			},
			results = {
				{ type="item", name="building-components-"..recipe_data.tier.."-"..recipe_data.tier_focus[1], amount_min=math.floor(recipe_data.base_qty/2), amount_max=recipe_data.base_qty },
				{ type="item", name="building-components-"..recipe_data.tier.."-"..recipe_data.tier_focus[2], probability=0.4, amount_min=math.floor(recipe_data.base_qty/4), amount_max=math.ceil(recipe_data.base_qty/2) },
				{ type="item", name="building-components-"..recipe_data.tier.."-"..recipe_data.tier_focus[3], probability=0.1, amount_min=1, amount_max=math.ceil(recipe_data.base_qty/4) },
			},
			allow_decomposition = false,
		},
		subgroup = "building-materials-b",
		order = "b[bc-"..recipe_data.tier.."]",
		allow_decomposition = false,
	}
	if data.raw.item[recipe_data.item].icon then
		toAdd.icons[#toAdd.icons+1] = { icon = data.raw.item[recipe_data.item].icon, scale=0.5, shift={-10, -10} }
	elseif data.raw.item[recipe_data.item].icons then
		toAdd.icons[#toAdd.icons+1] = { icon = data.raw.item[recipe_data.item].icons[1].icon, scale=0.5, shift={-10, -10} }
		buildM.log("bm: using one of multiple icons for item "..recipe_data.item)
	end
	
	
	if recipe_data.modifiers then
		for mod,mod_data in pairs(recipe_data.modifiers) do	
			if mod == "upscaled" then
				toAdd.name = toAdd.name.."-upscaled"
				toAdd.localised_name[#toAdd.localised_name+1] = {"lookup.upscaled"}
				toAdd.icons[2] = { icon = "__Building_Materials__/graphics/icons/pallet-"..(recipe_data.tier+1)..".png" }
				
				toAdd.normal.ingredients[1] = toAdd.normal.ingredients[1] * 1.5
				for _,result in pairs(toAdd.normal.results) do
					if result.probability then
						result.probability = result.probability / 2
					else
						result.min = math.ceil(result.min/2)
						result.max = math.ceil(result.max/2)
					end
				end
				
				toAdd.expensive.ingredients[1] = toAdd.expensive.ingredients[1] * 1.5
				for _,result in pairs(toAdd.expensive.results) do
					if result.probability then
						result.probability = result.probability / 2
					else
						result.min = math.ceil(result.min/2)
						result.max = math.ceil(result.max/2)
					end
				end
			--
			elseif mod == "enhancer" then
--				if not data.raw.item[mod_data.item_name] then
--					log("tried to form "..recipe_data.item.." with the non-existant enhancer: "..mod_data.item_name)
--				else
					toAdd.name = toAdd.name.."-enhanced-"..mod_data.item_name
					toAdd.localised_name[#toAdd.localised_name+1] = {"lookup.enhanced"}
					toAdd.normal.ingredients[#toAdd.normal.ingredients+1] = { type="item", name=mod_data.item_name, amount=mod_data.amount }
					toAdd.normal.results[1].amount_min = math.floor(recipe_data.base_qty/2*1.5)
					toAdd.normal.results[1].amount_max = math.floor(recipe_data.base_qty*1.5)
					if toAdd.normal.results[2] then toAdd.normal.results[2].probability = 0.3 end
					toAdd.normal.results[#toAdd.normal.results] = { type="item", name=mod_data.item_name, probability=0.9, amount=mod_data.amount }
					
					toAdd.expensive.ingredients[#toAdd.expensive.ingredients+1] = { type="item", name=mod_data.item_name, amount=mod_data.amount*2 }
					toAdd.expensive.results[1].amount_min = math.floor(recipe_data.base_qty/2*1.5)
					toAdd.expensive.results[1].amount_max = math.floor(recipe_data.base_qty*1.5)
					if toAdd.expensive.results[2] then toAdd.expensive.results[2].probability = 0.3 end
					toAdd.expensive.results[#toAdd.expensive.results] = { type="item", name=mod_data.item_name, probability=0.75, amount_min=mod_data.amount, amount_max=mod_data.amount*2 }
--				end
			elseif mod == "refined" then
				toAdd.name = toAdd.name.."-refined"
				toAdd.localised_name[#toAdd.localised_name+1] = {"lookup.refined"}
				for _,result in pairs(toAdd.normal.results) do
					result.amount_min = result.amount_min * 2
					result.amount_max = result.amount_max * 2
				end
				for _,result in pairs(toAdd.expensive.results) do
					result.amount_min = result.amount_min * 2
					result.amount_max = result.amount_max * 2
				end
			end
		end
	end
	if recipe_data.tier==0 then
		toAdd.category = "building-materials-0"
		toAdd.normal.enabled = true
		toAdd.expensive.enabled = true
		toAdd.icons[#toAdd.icons+1] = { icon = "__base__/graphics/icons/signal/signal_H.png", shift = {10, -10}, scale = 0.4 }
		data:extend({toAdd})
	else
		data:extend({toAdd})
		bobmods.lib.tech.add_recipe_unlock("building-materials-tier-"..recipe_data.tier, toAdd.name)
	end
end

buildM.generators.nil_precomposite = function(recipe_data)
	local recipe_name = recipe_data.item.."-"..recipe_data.tier
	for each,_ in pairs(recipe_data.modifiers) do
		recipe_name = recipe_name.."-"..each
	end
	if data.raw.recipe[recipe_name] then
		data.raw.recipe[recipe_name] = nil
	else
		log("bm: attempted to delete precomposite of "..recipe_name.." but it was not found")
	end
end