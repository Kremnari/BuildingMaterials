buildM.analysis = {}
local analysis = buildM.analysis
analysis.building_ing = {}

local build_cats = {"assembling-machine", "furnace", "boiler", "generator", "offshore-pump", "radar", "mining-drill", "solar-panel", "rocket-silo", "pump", "storage-tank", "accumulator", "beacon", "reactor",}


for _,each in pairs(data.raw['assembling-machine']) do
	if data.raw.recipe[each.name] then
		local recipe = data.raw.recipe[each.name]
		local ings
		if recipe.expensive then
			ings = recipe.expensive.ingredients
		elseif recipe.normal then
			ings = recipe.normal.ingredients
		else
			ings = recipe.ingredients
		end
		if ings==nil then
			log("didn't find ingredients for: "..each.name)
		else
			for _, ing in pairs(ings) do
				local ing_name
				local ing_count
				if ing.name then
					ing_name = ing.name
					ing_count = ing.amount
				else
					ing_name = ing[1]
					ing_count = ing[2]
				end
				if not data.raw['assembling-machine'][ing_name] then
					if not analysis.building_ing[ing_name] then
						analysis.building_ing[ing_name] = { count=0, amount=0 }
					end
					analysis.building_ing[ing_name].amount = analysis.building_ing[ing_name].amount + ing_count
					analysis.building_ing[ing_name].count = analysis.building_ing[ing_name].count + 1
				end
			end
		end
	else
		log("did not find recipe: "..each.name)
	end
end

for name,each in pairs(analysis.building_ing) do
	log("material: "..name.." with "..each.count.." count")
end