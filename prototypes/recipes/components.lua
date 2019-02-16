--[[
	this version is for dev purposes only
--]]

buildM.generators.create_component_from_recipe = function(recipe, tier, item)
	local c = table.deepcopy(data.raw.recipe[recipe])
	c.name = item.."-component"
	c.localised_name = {"recipe-name.component"}
	if data.raw.recipe[recipe].localised_name then
		c.localised_name[2] = data.raw.recipe[recipe].localised_name[1]
	else
		c.localised_name[2] = data.raw.recipe[recipe].name
	end
	local icons = {}
	icons = data.raw.item[item].icons or {{icon = data.raw.item[item].icon}}
	c.icon = nil
	c.icons = {}
	for _,each in pairs(icons) do
		if each.icon then
			c.icons[#c.icons+1] = each
		else
			c.icons[#c.icons+1] = { icon = each }
		end
	end
	c.icons[#c.icons+1] = { icon = "__Building_Materials__/graphics/icons/component-fabricator.png", scale= 0.4, shift={-10, 10} }
	
	--[[
	if c.icon then
		c.icons = {}
		if c.icon.icon then
			c.icons[#c.icons+1] = c.icon
		else
			c.icons[#c.icons+1] = { icon = c.icon, scale = 0.6, shift = { -10, -10 } }
		end
		c.icon = nil
	elseif c.icons then
		c.icons[1].scale = 0.4
		c.icons[1].shift = {-10, -10 }
	else
		c.icons = {}
		if data.raw.item[recipe].icon then
			c.icons[1] = { icon = data.raw.item[recipe].icon, scale = 0.6, shift = { -10, -10 } }
		elseif data.raw.item[recipe].icons then
			c.icons = data.raw.item[recipe].icons
			c.icons[1].scale = 0.4
			c.icons[2].scale = 0.4
		end
	end
	c.icons[#c.icons+1] = { icon = "__Building_Materials__/graphics/icons/component-fabricator.png" }
	--]]
	c.icon_size = 32
	c.category = "building-components-"..tier

	if c.ingredients then
		buildM.generators.adjust_component_ingredients(buildM.updater.remove_entity_ings(c.ingredients, item))
		if c.result then
			c.result = c.result.."-component"
		else
			c.results[1].name = c.results[1].name.."-component"
		end
	end
	if c.normal then
		buildM.generators.adjust_component_ingredients(buildM.updater.remove_entity_ings(c.normal.ingredients, item))
		if c.normal.results then
			c.normal.results[1].name = c.normal.results[1].name.."-component"
		elseif c.normal.result then
			c.normal.result = c.normal.result.."-component"
		end
		buildM.generators.adjust_component_ingredients(buildM.updater.remove_entity_ings(c.expensive.ingredients, item))
		if c.expensive.results then
			c.expensive.results[1].name = c.expensive.results[1].name.."-component"
		elseif c.expensive.result then
			c.expensive.result = c.expensive.result.."-component"
		end
	end
	local i = {
		type = "item",
		name = c.name,
		icons = c.icons,
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "building-components-rec-"..tier,
		order = "prefabs-"..c.name,
		stack_size = 200,
	}
	data:extend({c, i})
	bobmods.lib.tech.add_recipe_unlock(buildM.researcher.findTechUnlock(recipe), recipe.."-component")
	bobmods.lib.recipe.replace_ingredient(c.name, recipe, c.name)
	buildM.links.omni_compress_exclude(c.name)
	return c.name
end

buildM.updater.remove_entity_ings = function(ings, base)
	--log("in: "..#ings)
	for k, each in pairs(ings) do
		local name = each.name or each[1]
		--log('testing: '..name)
		if buildM.researcher.entity_list[name] then
			--log("testing: "..name)
			if data.raw.item[name.."-component"] then
				ings[k].name = name.."-component"
			else
				--log("removing: "..name)
				table.remove(ings, k)
			end
		end
	end
	--log("out: "..#ings)
	return ings
end

function remove_entity_ings2(ings, base)
	if string.match(base, "(.*)-%d") then
		log("base: "..string.match(base, "(.*)-%d"))
		for k, each in pairs(ings) do
			local name = each.name or each[1]
			local match = string.gsub(string.match(base, "(.*)-%d"), "%-", "%%-")
			log("item: "..(string.match(name, "(.*)-%d") or "no match: "..name))
			if string.find(name, match) then
				if data.raw.item[name.."-component"] then
					if ings[k].name then
						ings[k].name = name.."-component"
					else
						ings[k][1] = name.."-component"
					end
					log("changing to component")
				else
					log("removing")
					table.remove(ings, k)
				end
			end
		end
	end
	return ings
end

--Temp, for now
buildM.generators.adjust_component_ingredients = function(ings)
	for _,each in pairs(ings) do
		if each.amount then
			each.amount = math.ceil(each.amount * 0.75)
		elseif each[2] then
			each[2]  = math.ceil(each[2] * 0.75)
		end
	end
end

buildM.generators.create_component_from_ingredients = function(recipe_data)
	local icons = {}
	if recipe_data.icon then
		icons[#icons+1] = { icon = recipe_data.icon }
	else
		icons = buildM.general.get_iconset_by_name(recipe_data.iconName or recipe_data.name)
	end
	local item = {
	    type = "item",
	    name = recipe_data.name,
	    --localised_name = {"recipe-name.component", data.raw.item[recipe_data.name].localised_name },
	    icons = icons,
	    icon_size = 32,
	    flags = {"goes-to-main-inventory"},
	    subgroup = "building-components-"..recipe_data.tier,
	    order = recipe_data.name,
	    stack_size = 50
  	}
  	local ings = {}
  	for _,each in pairs(recipe_data.ings) do
  		ings[#ings+1] = { type = "item", name = each[1], amount = (each[2] or 1) }
  	end
	local recipe = {
		type = "recipe",
		name = recipe_data.name.."-"..recipe_data.tier,
		--localised_name = {recipe_data.name, {"lookup.class-"..recipe_data.tier} },
		icons = icons,
		icon_size = 32,
		category = "building-components-"..recipe_data.tier,
		normal = {
			ingredients = ings,
			energy_required = (recipe_data.energy or 4),
			enabled = false,
			results = {{ type = "item", name = recipe_data.name, amount = (recipe_data.amount or 1) }}
		},
		expensive = {
			ingredients = ings,
			energy_required = (recipe_data.energy or 4) * 1.5,
			enabled = false,
			results = {{ type = "item", name = recipe_data.name, amount = (recipe_data.amount or 1) }}
		},
		allow_decomposition = true
	}
	if recipe_data.tier == 0 then
		recipe.normal.enabled = true
		recipe.expensive.enabled = true
		recipe.category = nil
	end
	local unlock_tech = "building-components-tier-"..recipe_data.tier
	if recipe_data.override then
		recipe.name = "omnirec-"..recipe.name --would need to add lettering... but i need to decide if I want to allow differing inputs overriding
		unlock_tech = "omnitech-"..unlock_tech
	end
	data:extend({item, recipe})
	bobmods.lib.tech.add_recipe_unlock(unlock_tech, recipe.name)
	buildM.links.omni_compress_exclude(recipe.name)
end