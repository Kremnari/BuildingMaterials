local circuits = {"basic-circuit-board", "electronic-circuit", "advanced-circuit", "processing-unit", "advanced-processing-unit"}
local inserters = {{item="inserter", amount=1},{item="fast-inserter", amount=2},{item="stack-inserter", amount=3},{item="express-inserter", amount=4},{item="express-stack-inserter", amount=5}}
--local inserters = {{item="inserter", amount=1},{item="inserter", amount=1},{item="inserter", amount=1},{item="inserter", amount=1},{item="inserter", amount=1}}

for idx = 1,5,1 do
	local cnc = {
		type = "recipe",
		name = "building-cncs-"..idx,
		localised_name = {"item-name.building-cncs", {"lookup.class-"..idx }, {"lookup.space"} },
		category = "building-cncs-"..idx,
		icons = {
			{ icon = "__Building_Materials__/graphics/icons/cnc-designer.png" },
			{ icon = "__Building_Materials__/graphics/icons/pallet-"..idx..".png" },
		},
		icon_size = 32,
		normal = {
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type="item", name=circuits[idx], amount=5 },
				{ type="item", name=inserters[idx].item, amount=inserters[idx].amount }
			},
			results = { { type="item", name="building-cncs-"..idx, amount=1 } },
			allow_decomposition = false
		},
		expensive = {
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type="item", name=circuits[idx], amount=10 },
				{ type="item", name=inserters[idx].item, amount=inserters[idx].amount*2 }
			},
			results = {
				 { type="item", name="building-cncs-"..idx, amount=1 },
			},
			allow_decomposition = false
		},
		subgroup = "building-cncs-a",
		order = "a[bm-"..idx.."]",
	}
	local cnc_item = {
		type = "item",
		name = "building-cncs-"..idx,
		localised_name = {"item-name.building-cncs", {"lookup.class-"..idx }, {"lookup.space"} },
		icons = table.deepcopy(cnc.icons),
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "building-cncs-a",
		order = "a-"..idx,
		stack_size = 200,
	 }
	
	local cncf = table.deepcopy(cnc)
	cncf.name = "building-cncsf-"..idx
	cncf.localised_name[3] = {"lookup.withFluid"}
	cncf.normal.ingredients[3] = {type="item", name="water-pump", amount=inserters[idx].amount}
	cncf.normal.results[1].name = "building-cncsf-"..idx
	cncf.expensive.ingredients[3] = {type="item", name="pump", amount=inserters[idx].amount*2}
	cncf.expensive.results[1].name = "building-cncsf-"..idx
	cncf.icons[#cncf.icons+1] = {icon = "__Building_Materials__/graphics/icons/plus.png", shift={0, 10}, scale=0.4 }
	
	local cncf_item = table.deepcopy(cnc_item)
	cncf_item.name = "building-cncsf-"..idx
	cncf_item.localised_name[3] = {"lookup.withFluid"}
	cncf_item.icons[#cncf_item.icons+1] = {icon = "__Building_Materials__/graphics/icons/plus.png", shift={0, 10}, scale=0.4 }
	
	
	data:extend({ cnc_item, cncf_item, cnc, cncf })
	bobmods.lib.tech.add_recipe_unlock("building-materials-tier-"..idx, "building-cncs-"..idx)
	bobmods.lib.tech.add_recipe_unlock("building-materials-tier-"..idx, "building-cncsf-"..idx)
end

