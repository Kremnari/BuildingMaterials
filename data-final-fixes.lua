--  not needed atm
--require("analysis/buildings")

log("bh: "..buildM.settings.burner_handling)
if buildM.settings.burner_handling ~= "skip burner" then
	require("prototypes/tier-0")
	if buildM.settings.burner_handling == "sp0" then
		if not mods["aai-industry-sp0"] then
			require("prototypes/romtos")
		end
	elseif buildM.settings.burner_handling == "basic automation" then
		for _,each in pairs({"basic-transport-belt", "basic-splitter", "burner-inserter"}) do
			local temp = data.raw.recipe[each]
			if temp then
				temp.enabled = true
				if temp.normal then
					temp.normal.enabled = true
					temp.expensive.enabled = true
				end
			end
		end
		if data.raw.technology["basic-logistics"] then
			bobmods.lib.tech.remove_recipe_unlock("basic-logistics", "basic-transport-belt")
			bobmods.lib.tech.remove_recipe_unlock("basic-logistics", "transport-belt")
			bobmods.lib.tech.remove_recipe_unlock("basic-logistics", "basic-underground-belt")
			data.raw.technology["basic-logistics"].enabled = false
		end
		if data.raw.technology["basic-automation"] then
			bobmods.lib.tech.remove_recipe_unlock("basic-automation", "burner-inserter")
			bobmods.lib.tech.add_recipe_unlock("basic-automation", "transport-belt")
			bobmods.lib.tech.add_recipe_unlock("basic-automation", "basic-underground-belt")
			bobmods.lib.tech.add_prerequisite("logistics", "basic-automation")
			bobmods.lib.tech.remove_prerequisite("logistics", "basic-logistics")
		end
		if settings.startup["bobmods-logistics-beltoverhaul"].value == true then
			bobmods.lib.tech.remove_prerequisite("logistics", "bob-logistics-0")
			bobmods.lib.tech.remove_recipe_unlock("bob-logistics-0", "basic-splitter")
			data.raw.technology["bob-logistics-0"].enabled = false
		end
	end
else
	
end
require("prototypes/recipes/update-buildings")
require("prototypes/technologies/final")
if not data.raw.lab["burner-lab"] then
	data.raw.recipe["lab"].category = "crafting"
end


--[[
turret categories:
------------------
turret
ammo-turret
artillery-turret
electric-turret
fluid-turret
--]]