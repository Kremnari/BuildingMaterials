--[[
	bldg_from_components:
	bldg = string, building name
	components = array, item names
	that simple
--]]

local bfc = buildM.updater.bldg_from_components

bfc({bldg = "stone-furnace", tier = 0, components = {"burner-unit"}})
bfc({bldg = "boiler", tier = 0, components = {"burner-unit", "boiler-component"}, fluids = true})
bfc({bldg = "steam-engine", tier = 0, components = {"industrial-engine", "generator-coils"}, fluids = true})
bfc({bldg = "burner-mining-drill", tier = 0, components = {"burner-unit", "basic-mining-equipment"}})
bfc({bldg = "lab", tier = 1, components = {"scipack-consumer", "scanning-array"}})

bfc({bldg = "assembling-machine-1", tier = 1, components = {"cnc-equipment"}})
bfc({bldg = "electric-mining-drill", tier = 1, components = {"mining-drill", "heavy-duty-motor"}})

bfc({bldg = "assembling-machine-2", tier = 2, components = {{"cnc-equipment", 2}, }})
bfc({bldg = "assembling-machine-3", tier = 3, components = {{"cnc-equipment", 2}, "adv-cnc-equipment", }, fluids = true})
bfc({bldg = "oil-refinery", tier = 1, components = {"distillation-chamber", "heater-core"}, fluids = true})
bfc({bldg = "chemical-plant", tier = 1, components = {{"mixing-vat", 2}}, fluids = true})
bfc({bldg = "centrifuge", tier = 2, components = {"weight-balance", "heavy-duty-motor"}})
bfc({bldg = "solar-panel", tier = 1, components = {{"photo-cell-array",2}, "voltage-regulator"}})
bfc({bldg = "steam-turbine", tier = 1, components = {"turbine-unit","generator-coils"}, fluids = true})
bfc({bldg = "nuclear-reactor", tier = 4, components = {"radiation-shielding", "reaction-chamber", "regulation-system"}})
bfc({bldg = "steel-furnace", tier = 2, components = {"burner-unit", "smelting-vessel"}})
bfc({bldg = "electric-furnace", tier = 2, components = {"heater-core", "boiler-component"}})
bfc({bldg = "accumulator", tier = 2, components = {"voltage-regulator", "battery-array"}})
bfc({bldg = "pumpjack", tier = 3, components = {"counter-balanced-engine", "pump-shaft-drill"}, fluids = true})

bfc({bldg = "beacon", tier = 3, components = {"transmission-tower", "effects-processing-unit"}})
bfc({bldg = "radar", tier = 1, components = {"transmission-tower", "scanning-array"}})
bfc({bldg = "storage-tank", tier = 1, components = {"fluid-tank"} })

bfc({bldg = "rocket-silo", tier = 5, components = {"gantry-system", "control-tower", }})
buildM.updater.skip_recipe("pump")