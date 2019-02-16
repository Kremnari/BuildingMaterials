data:extend({
  {
    type = "tool",
    name = "science-pack-0",
    icon = "__Building_Materials__/graphics/icons/romtos/science-pack-0.png",
    icon_size = 32,
    flags = {"goes-to-main-inventory"},
    subgroup = "science-pack",
    order = "a[science-pack-0]",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value"
  },    
  {
    type = "recipe",
    name = "science-pack-0",
    category = "crafting",
    normal = {
      energy_required = 0.6,
      ingredients = {
        {type="item", name="copper-plate", amount=2},
        {type="item", name="iron-gear-wheel", amount=1}
      },
      results= { {type="item", name="science-pack-0", amount=1} },
    },
    expensive = {
      energy_required = 0.6,
      ingredients = {
        {type="item", name="copper-plate", amount=4},
        {type="item", name="iron-gear-wheel", amount=2}
      },
      results= { {type="item", name="science-pack-0", amount=1} },
    },
    },
})


bobmods.lib.tech.remove_science_pack("basic-logistics", "science-pack-1")
bobmods.lib.tech.remove_science_pack("bob-logistics-0", "science-pack-1")
bobmods.lib.tech.remove_science_pack("building-materials-tier-1", "science-pack-1")
bobmods.lib.tech.remove_science_pack("basic-automation", "science-pack-1")
bobmods.lib.tech.add_science_pack("basic-logistics", "science-pack-0", 10)
bobmods.lib.tech.add_science_pack("bob-logistics-0", "science-pack-0", 10)
bobmods.lib.tech.add_science_pack("basic-automation", "science-pack-0", 15)
bobmods.lib.tech.add_science_pack("building-materials-tier-1", "science-pack-0", 20)
