for tier=0,5,1 do
	for _,idx in pairs({'a', 'b', 'c'}) do
		data:extend(
		{
			{
				type = "item",
				name = "building-components-"..tier.."-"..idx,
				localised_name= {"item-name.precomposite", {"lookup.class-"..tier}, {"lookup.tier-focus-"..idx}, {"lookup.space"} },
				icons = {
					{ icon = "__Building_Materials__/graphics/icons/component-"..idx..".png" },
					{ icon = "__Building_Materials__/graphics/icons/pallet-"..tier..".png" },
				},
				icon_size = 32,
				flags = {"goes-to-main-inventory"},
				subgroup = "building-materials-"..idx,
				order = "b[bm-"..tier..idx.."]",
				stack_size = 200
			}
		})
	end
end