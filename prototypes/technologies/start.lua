local generate_tech = function(tech_tier)
	local tech = {
		type = "technology",
		name = "building-materials-tier-"..tech_tier,
		localised_name = {"technology-name.building-materials", {"lookup.class-"..tech_tier}},
		icons = {
			{ icon = "__Building_Materials__/graphics/icons/pallet.png" },
			{ icon = "__Building_Materials__/graphics/icons/pallet-"..tech_tier..".png" },
		},
		icon_size = 32,
		prerequisites = {
			"building-upscale-tier-"..(tech_tier-1),
		},
		effects = {},
		unit = {
			count = 50 * tech_tier * tech_tier,
			ingredients = {{ "science-pack-1", 1 }},
			time = 30,
		},
		order = "bm-"..tech_tier,
	}
	if tech_tier == 1 then
		tech.prerequisites = {}
	end
	if tech_tier > 1 then
		tech.unit.ingredients[2] = { "science-pack-2", 1 }
	end
	if tech_tier > 3 then
		tech.unit.ingredients[3] = { "science-pack-3", 1 }
	end
	
	local compo_tech = table.deepcopy(tech)
	compo_tech.name = "building-components-tier-"..tech_tier
	compo_tech.localised_name = {"technology-name.building-components", {"lookup.class-"..tech_tier} }
	compo_tech.icons[3] = { icon = "__Building_Materials__/graphics/icons/unknown.png", scale = 0.4, shift = {-10, 10} }
	compo_tech.prerequisites[1] = "building-materials-tier-"..tech_tier
	
	local omni_override_tech = table.deepcopy(tech)
	omni_override_tech.name = "building-upscale-tier-"..tech_tier
	omni_override_tech.localised_name = {"technology-name.building-upgrades", {"lookup.class-"..tech_tier} }
	omni_override_tech.icons[3] = { icon = "__Building_Materials__/graphics/icons/unknown.png", scale = 0.4, shift = {-10, 10} }
	omni_override_tech.icons[4] = { icon = "__Building_Materials__/graphics/icons/unknown.png", scale = 0.4, shift = {10, 10} }
	omni_override_tech.prerequisites[1] = "building-components-tier-"..tech_tier
	data:extend({tech, compo_tech, omni_override_tech})
end

for idx = 1,5,1 do
	generate_tech(idx)
end