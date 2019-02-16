local tier_tints = { {r=255, g=224, b=0, a=1}, {r=232, g=0, b=0, a=1}, {r=0, g=0, b=255, a=1}, {r=255, g=0, b=255, a=1}, {r=0, g=255, b=0, a=1} } -- tier 0 {r=112, g=84, b=0, a=1}

buildM.generators.shops = function(recipe_data)
	local icons = {}
	icons[1] = { icon = "__Building_Materials__/graphics/icons/"..recipe_data.type.."-grey.png", tint = tier_tints[recipe_data.tier] }
	
	local entity = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
	entity.name = recipe_data.type.."-"..recipe_data.tier
	entity.localised_name = {"entity-name."..recipe_data.type, {"lookup.class-"..recipe_data.tier}}
	entity.localised_description = {"entity-description."..recipe_data.type }
	entity.icon = nil
	entity.icons = icons
	entity.icon_size = 32
	entity.crafting_categories = {}
	for i = 1,recipe_data.tier do
		entity.crafting_categories[i] = recipe_data.crafting_cat.."-"..i
	end
	if recipe_data.type=="machine-shop" then
		entity.crafting_categories[#entity.crafting_categories+1] = recipe_data.crafting_cat.."-0"
	end
	entity.crafting_speed = recipe_data.speed
	entity.ingredient_count = 5
	entity.module_specification = { module_slots = recipe_data.num_modules }
	entity.allowed_effects = { "consumption", "speed" }
	entity.fast_replaceable_group = recipe_data.type
    	entity.minable = {mining_time = 1, result = recipe_data.type.."-"..recipe_data.tier}
    
	if recipe_data.pic_scale then
		entity.animation = {
			layers = {
				{
					filename="__Building_Materials__/graphics/entity/"..recipe_data.type.."-"..recipe_data.tier..".png",
					priority="high",
					width=recipe_data.icon_size,
					height=recipe_data.icon_size,
					frame_count=1,
					line_length=1,
					scale = recipe_data.pic_scale
				}
			}
		}
	end
	if recipe_data.grid_size then
		entity.collision_box = { {-recipe_data.grid_size*.85, -recipe_data.grid_size*.85}, {recipe_data.grid_size*.85,recipe_data.grid_size*.85} }
		entity.selection_box = { {-recipe_data.grid_size, -recipe_data.grid_size}, {recipe_data.grid_size,recipe_data.grid_size} }
	end

	data:extend({
		entity,
		{
			type = "item",
			name = recipe_data.type.."-"..recipe_data.tier,
			localised_name = {"entity-name."..recipe_data.type, {"lookup.class-"..recipe_data.tier}},
			icons = icons,
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			place_result = recipe_data.type.."-"..recipe_data.tier,
			subgroup = recipe_data.type.."s",
			order = recipe_data.order,
			stack_size = 20
		},
		{
			type = "recipe",
			name = recipe_data.type.."-"..recipe_data.tier,
			localised_name = {"entity-name."..recipe_data.type, {"lookup.class-"..recipe_data.tier}},
			localised_description = {"entity-description."..recipe_data.type },
			icons = icons,
			icon_size = 32,
			normal = {
				energy_required = 5,
				enabled = false,
				ingredients = {
					{ type = "item", name="building-materials-"..(recipe_data.tier-1), amount=10 }
				},
				results = { { type="item", name=recipe_data.type.."-"..recipe_data.tier, amount=1 } },
			},
			expensive = {
				energy_required = 5,
				enabled = false,
				ingredients = {
					{ type = "item", name="building-materials-"..(recipe_data.tier-1), amount=20 }
				},
				results = { { type="item", name=recipe_data.type.."-"..recipe_data.tier, amount=1 } },
			},
			subgroup = recipe_data.type.."s",
			order = recipe_data.order,
		},
	})
	bobmods.lib.tech.add_recipe_unlock("building-materials-tier-"..recipe_data.tier, recipe_data.type.."-"..recipe_data.tier)
	--buildM.updater.skip_recipe(recipe_data.type.."-"..recipe_data.tier)
end


local data_list = {
	{ name = "machine-shop", craft_cat = "building-material-components", pic_scale = 1, icon_size=112, grid_size = 1.5  },
	{ name = "material-packager", craft_cat = "building-materials", pic_scale = 1, grid_size = 2.5, icon_size=160,  },
	{ name = "cnc-designer", craft_cat = "building-cncs", pic_scale = 1, grid_size = 2, icon_size=128,  },
	{ name = "component-fabricator", craft_cat = "building-components", pic_scale = 1, grid_size = 2, icon_size=128,  },
	{ name = "construction-yard", craft_cat = "buildings", pic_scale = 0.75, grid_size = 3.5, icon_size=384, }
}

for idx = 1,5,1 do 
	buildM.generators.shops({type=data_list[idx].name, tier=1, speed=1,   num_modules=1, order="a", crafting_cat=data_list[idx].craft_cat, pic_scale=data_list[idx].pic_scale, grid_size=data_list[idx].grid_size, icon_size=data_list[idx].icon_size})
	buildM.generators.shops({type=data_list[idx].name, tier=2, speed=1.5, num_modules=1, order="b", crafting_cat=data_list[idx].craft_cat, pic_scale=data_list[idx].pic_scale, grid_size=data_list[idx].grid_size, icon_size=data_list[idx].icon_size})
	buildM.generators.shops({type=data_list[idx].name, tier=3, speed=3,   num_modules=2, order="c", crafting_cat=data_list[idx].craft_cat, pic_scale=data_list[idx].pic_scale, grid_size=data_list[idx].grid_size, icon_size=data_list[idx].icon_size})
	buildM.generators.shops({type=data_list[idx].name, tier=4, speed=4,   num_modules=2, order="d", crafting_cat=data_list[idx].craft_cat, pic_scale=data_list[idx].pic_scale, grid_size=data_list[idx].grid_size, icon_size=data_list[idx].icon_size})
	buildM.generators.shops({type=data_list[idx].name, tier=5, speed=5,   num_modules=3, order="e", crafting_cat=data_list[idx].craft_cat, pic_scale=data_list[idx].pic_scale, grid_size=data_list[idx].grid_size, icon_size=data_list[idx].icon_size})
end


local entity = table.deepcopy(data.raw["furnace"]["stone-furnace"])
log("furnace: "..serpent.dump(data.raw["furnace"]["stone-furnace"]))

data:extend({
	{
		type = "item",
		name = "decon-building",
		--localised_name = {"entity-name."..recipe_data.type, {"lookup.class-"..recipe_data.tier}},
		icons = { {icon = "__Building_Materials__/graphics/icons/decon-bldg.png" }},
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		place_result = "decon-building",
		subgroup = "construction-yards",
		order = "z",
		stack_size = 20
	},
	{
		type = "recipe",
		name = "decon-building",
		--localised_name = {"entity-name."..recipe_data.type, {"lookup.class-"..recipe_data.tier}},
		--localised_description = {"entity-description."..recipe_data.type },
		icons = { {icon = "__Building_Materials__/graphics/icons/decon-bldg.png" }},
		icon_size = 32,
		crafting_category = "buildings-1",
		normal = {
			energy_required = 5,
			enabled = true,
			ingredients = {
				{ type = "item", name="building-materials-1", amount=10 }
			},
			results = { { type="item", name="decon-building", amount=1 } },
		},
		expensive = {
			energy_required = 5,
			enabled = true,
			ingredients = {
				{ type = "item", name="building-materials-1", amount=20 }
			},
			results = { { type="item", name="decon-building", amount=1 } },
		},
		subgroup = "construction-yards",
		order = "z",
	},
	{
		type = "furnace",
		name = "decon-building",
		icons = { { icon = "__Building_Materials__/graphics/icons/decon-bldg.png" } },
		icon_size = 32,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 1, result = "decon-building" },
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{ -3.8, -3.8 }, { 3.8, 3.8}},
		selection_box = {{ -4, -4}, { 4, 4}},
		module_specification = {
			module_slots = 2
		},
		allowed_effects = {"consumption", "speed", "pollution" },
		crafting_categories = {"building-decon"},
		result_inventory_size = 5,
		result_count = 5,
		crafting_speed = 1,
		source_inventory_size = 1,
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.01 / 2.5
		},
		energy_usage = "100kW",
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
	    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
	    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
	    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
	},
})

