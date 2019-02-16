for idx = 0,5,1 do
	toAdd = {
		type = "recipe",
		name = "building-materials-"..idx,
		localised_name = {"recipe-name.building-materials", {"lookup.class-"..idx }, {"lookup.space"}, {"lookup.space"} },
		localised_description = {"item-description.building-materials", {"lookup.class-"..idx } },
		category = "building-materials-"..idx,
		icons = {
			{ icon = "__Building_Materials__/graphics/icons/pallet.png" },
			{ icon = "__Building_Materials__/graphics/icons/pallet-"..idx..".png" },
		},
		icon_size = 32,
		normal = {
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type="item", name="building-components-"..idx.."-a", amount=10},
				{ type="item", name="building-components-"..idx.."-b", amount=5 },
				{ type="item", name="building-components-"..idx.."-c", amount=2 }
			},
			results = {
				{ type="item", name="building-materials-"..idx, amount=1 }
			},
			allow_decomposition = false
		},
		expensive = {
			energy_required = 5,
			enabled = false,
			ingredients = {
				{ type="item", name="building-components-"..idx.."-a", amount=20},
				{ type="item", name="building-components-"..idx.."-b", amount=10},
				{ type="item", name="building-components-"..idx.."-c", amount=5 }
			},
			results = {
				 { type="item", name="building-materials-"..idx, amount=1 },
				 --{ type="item", name="building-waste-"..idx, amount=1 },
			},
			allow_decomposition = false
		},
		subgroup = "building-materials-a",
		order = "a[bm-"..idx.."]",
		allow_decomposition = false,
	}
	if idx == 0 then
		for _,dif in pairs({'normal', 'expensive'}) do
			for _,each in pairs(toAdd[dif].ingredients) do
				each.amount = math.ceil(each.amount / 3)
			end
			toAdd[dif].enabled = true
		end
	end
	---[[  to allow upscaling while precomposites still forming
	if idx < 5 then
		local upscaled = table.deepcopy(toAdd)
		upscaled.name = upscaled.name.."-upscaled"
		upscaled.localised_name[3] = {"lookup.upscaled"}
		upscaled.icons[#upscaled.icons] = { icon = "__Building_Materials__/graphics/icons/pallet-"..(idx+1)..".png" }
		upscaled.icons[#upscaled.icons+1] = { icon = "__Building_Materials__/graphics/icons/plus.png", scale = 0.4, shift= {10, -10} }
		for _,each in pairs(upscaled.normal.ingredients) do
			each.amount = each.amount * 2
		end
		upscaled.normal.results[1].name = "building-materials-"..(idx+1)
		for _,each in pairs(upscaled.expensive.ingredients) do
			each.amount = each.amount * 3
		end
		upscaled.expensive.results[1].name = "building-materials-"..(idx+1)
		data:extend({upscaled})
		if idx ~= 0 then
			bobmods.lib.tech.add_recipe_unlock("building-upscale-tier-"..idx, "building-materials-"..idx.."-upscaled")
		else
			bobmods.lib.tech.add_recipe_unlock("building-materials-tier-1", "building-materials-"..idx.."-upscaled")
		end
	end
	--]]
	
	data:extend({toAdd})
	bobmods.lib.tech.add_recipe_unlock("building-materials-tier-"..idx, "building-materials-"..idx)
end

