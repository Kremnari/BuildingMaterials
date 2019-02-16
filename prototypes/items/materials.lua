for idx=0,5,1 do
	data:extend({
		{
			type = "item",
			name = "building-materials-"..idx,
			localised_name = {"item-name.building-materials", {"lookup.class-"..idx } },
			icons = {
				{ icon = "__Building_Materials__/graphics/icons/pallet.png" },
				{ icon = "__Building_Materials__/graphics/icons/pallet-"..idx..".png"},
			},
			icon_size = 32,
			flags = {"goes-to-main-inventory"},
			subgroup = "building-materials-a",
			order = "a[bm-"..idx.."]",
			stack_size = 200
		}
	})
end
