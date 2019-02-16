local entity = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-1"])
entity.name = "burner-workshop"
entity.icon = nil
entity.icons = {
			{ icon = "__bobassembly__/graphics/icons/assembling-machine-6.png" },
			{ icon = "__Building_Materials__/graphics/icons/machine-shop.png", scale=0.75 },
		}
entity.crafting_categories = {"building-material-components-0", "building-materials-0"}
entity.crafting_speed = 1
entity.ingredient_count = 3
entity.fast_replaceable_group = nil
entity.energy_source = {
	type = "burner",
	fuel_category = "chemical",
	effectivity = 0.5,
	fuel_inventory_size = 1,
	emissions = 0.1,
	smoke = { {
		name = "smoke",
		deviation = { 0.1, 0.1 },
		position = { 0.5, -1.5 },
		frequency = 3,
		} }
}
entity.minable = {mining_time = 1, result = "burner-workshop"}
entity.animation = {
	layers = {
		{
			filename = "__Building_Materials__/graphics/entity/burner-workshop.png",
			priority = "high",
			width = 384,
			height = 384,
			frame_count = 1,
			line_length = 1,
			scale = 0.1875
		}
	}
}
	entity.collision_box = { {-0.9, -0.9}, {0.9,0.9} }
	entity.selection_box = { {-1, -1}, {1,1} }

local stone_component = table.deepcopy(data.raw.recipe["stone-building-components-0"])
stone_component.name = stone_component.name.."-hand"
stone_component.category = "crafting"
stone_component.normal.enabled = true
stone_component.normal.ingredients[1].amount = stone_component.normal.ingredients[1].amount * 1.5
stone_component.expensive.enabled = true
stone_component.expensive.ingredients[1].amount = stone_component.expensive.ingredients[1].amount * 1.5
stone_component.allow_decomposition = false

local wood_component = table.deepcopy(data.raw.recipe["raw-wood-building-components-0"])
wood_component.name = wood_component.name.."-hand"
wood_component.category = "crafting"
wood_component.normal.enabled = true
wood_component.normal.ingredients[1].amount = wood_component.normal.ingredients[1].amount * 1.5
wood_component.expensive.enabled = true
wood_component.expensive.ingredients[1].amount = wood_component.expensive.ingredients[1].amount * 1.5
wood_component.allow_decomposition = false

local iron_plate_component = table.deepcopy(data.raw.recipe["iron-plate-building-components-0"])
iron_plate_component.name = iron_plate_component.name.."-hand"
iron_plate_component.category = "crafting"
iron_plate_component.normal.enabled = true
iron_plate_component.normal.ingredients[1].amount = iron_plate_component.normal.ingredients[1].amount * 1.5
iron_plate_component.expensive.enabled = true
iron_plate_component.expensive.ingredients[1].amount = iron_plate_component.expensive.ingredients[1].amount * 1.5
iron_plate_component.allow_decomposition = false

local material = table.deepcopy(data.raw.recipe["building-materials-0"])
material.name = material.name.."-hand"
material.category = "crafting"
material.normal.ingredients[1].amount = 5
material.normal.ingredients[2].amount = 3
material.normal.ingredients[3].amount = 1
material.expensive.ingredients[1].amount = 10
material.expensive.ingredients[2].amount = 5
material.expensive.ingredients[3].amount = 2

data:extend({
	entity,
	stone_component,
	wood_component,
	iron_plate_component,
	material,
	{
		type = "item",
		name = "burner-workshop",
		icons = {
			{ icon = "__bobassembly__/graphics/icons/assembling-machine-6.png" },
			{ icon = "__Building_Materials__/graphics/icons/machine-shop.png", scale=0.75 },
		},
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		place_result = "burner-workshop",
		subgroup = "machine-shops",
		order = "z",
		stack_size = 20,
	},
	{
		type = "recipe",
		name = "burner-workshop",
		icons = {
			{ icon = "__bobassembly__/graphics/icons/assembling-machine-6.png" },
			{ icon = "__Building_Materials__/graphics/icons/machine-shop.png", scale=0.75 },
		},
		icon_size = 32,
		normal = {
			energy_required = 5,
			ingredients = {
				{ type = "item", name = "building-materials-0", amount = 2 },
				{ type = "item", name = "repair-pack", amount = 2 },
			},
			results = {
				{ type = "item", name = "burner-workshop", amount = 1 }
			},
		},
		expensive = {
			energy_required = 5,
			ingredients = {
				{ type = "item", name = "building-materials-0", amount = 5 },
				{ type = "item", name = "repair-pack", amount = 5 },
			},
			results = {
				{ type = "item", name = "burner-workshop", amount = 1 }
			},
		},
		subgroup = "machine-shops",
		order = "z",
	},
})
buildM.updater.skip_recipe("burner-workshop")
