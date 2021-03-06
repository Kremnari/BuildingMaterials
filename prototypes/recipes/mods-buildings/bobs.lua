local bfc = buildM.updater.bldg_from_components

buildM.updater.skip_recipe("bob-pump-2")
buildM.updater.skip_recipe("bob-pump-3")
buildM.updater.skip_recipe("bob-pump-4")
buildM.updater.skip_recipe("bob-valve")
buildM.updater.skip_recipe("void-pump")
buildM.updater.skip_recipe("water-pump")
buildM.updater.skip_recipe("water-pump-2")
buildM.updater.skip_recipe("water-pump-3")
buildM.updater.skip_recipe("water-pump-4")
buildM.updater.skip_recipe("air-pump")
buildM.updater.skip_recipe("air-pump-2")
buildM.updater.skip_recipe("air-pump-3")
buildM.updater.skip_recipe("air-pump-4")

-- Resource things
bfc({bldg = "bob-mining-drill-1", tier = 1, components = {"mining-drill", "heavy-duty-motor"} })
bfc({bldg = "bob-mining-drill-2", tier = 2, components = {{"mining-drill", 2}, {"heavy-duty-motor", 2}} })
bfc({bldg = "bob-mining-drill-3", tier = 3, components = {{"mining-drill", 3}, {"heavy-duty-motor", 3}} })
bfc({bldg = "bob-mining-drill-4", tier = 4, components = {{"mining-drill", 4}, {"heavy-duty-motor", 4}} })
bfc({bldg = "bob-area-mining-drill-1", tier = 1, components = {"mining-drill", "heavy-duty-motor"} })
bfc({bldg = "bob-area-mining-drill-2", tier = 2, components = {{"mining-drill", 2}, {"heavy-duty-motor", 2}} })
bfc({bldg = "bob-area-mining-drill-3", tier = 3, components = {{"mining-drill", 3}, {"heavy-duty-motor", 3}} })
bfc({bldg = "bob-area-mining-drill-4", tier = 4, components = {{"mining-drill", 4}, {"heavy-duty-motor", 4}} })
bfc({bldg = "bob-pumpjack-1", tier = 2, components = {"counter-balanced-engine", "pump-shaft-drill"}, fluids = true})
bfc({bldg = "bob-pumpjack-2", tier = 3, components = {{"counter-balanced-engine", 2}, {"pump-shaft-drill", 2}}, fluids = true})
bfc({bldg = "bob-pumpjack-3", tier = 4, components = {{"counter-balanced-engine", 3}, {"pump-shaft-drill", 3}}, fluids = true})
bfc({bldg = "bob-pumpjack-4", tier = 5, components = {{"counter-balanced-engine", 4}, {"pump-shaft-drill", 4}}, fluids = true})

-- Crafty-er Things
bfc({bldg = "assembling-machine-4", tier = 3, components = {{"cnc-equipment", 3}, {"adv-cnc-equipment",2} }, fluids = true})
bfc({bldg = "assembling-machine-5", tier = 4, components = {{"cnc-equipment", 4}, {"adv-cnc-equipment",3} }, fluids = true})
bfc({bldg = "assembling-machine-6", tier = 5, components = {{"cnc-equipment", 5}, {"adv-cnc-equipment",4} }, fluids = true})
bfc({bldg = "electronics-machine-1", tier = 1, components = {"board-printer", "solder-device"} })
bfc({bldg = "electronics-machine-2", tier = 2, components = {{"board-printer", 2}, {"solder-device", 2}} })
bfc({bldg = "electronics-machine-3", tier = 3, components = {{"board-printer", 3}, {"solder-device", 3}} })
bfc({bldg = "chemical-plant-2", tier = 2, components = {{"mixing-vat", 3}}, fluids = true })
bfc({bldg = "chemical-plant-3", tier = 3, components = {{"mixing-vat", 4}}, fluids = true })
bfc({bldg = "chemical-plant-4", tier = 4, components = {{"mixing-vat", 5}}, fluids = true })

-- Furnace Things
bfc({bldg = "chemical-furnace", components = {}})
bfc({bldg = "chemical-steel-furnace", components = {}})
bfc({bldg = "chemical-boiler", components = {}})
bfc({bldg = "mixing-furnace", components = {}})
bfc({bldg = "mixing-steel-furnace", components = {}})
bfc({bldg = "electric-mixing-furnace", components = {}})
bfc({bldg = "electric-furnace-2", components = {}})
bfc({bldg = "electric-furnace-3", components = {}})

-- Chemical Things
bfc({bldg = "oil-refinery-2", tier = 2, components = {}, fluids = true })
bfc({bldg = "oil-refinery-3", tier = 3, components = {}, fluids = true })
bfc({bldg = "oil-refinery-4", tier = 4, components = {}, fluids = true })
bfc({bldg = "bob-distillery", tier = 2, components = {{"distillation-chamber",3}, }, fluids = true})
bfc({bldg = "electrolyser", tier = 2, components = {}, fluids = true })
bfc({bldg = "electrolyser-2", tier = 3, components = {}, fluids = true })
bfc({bldg = "electrolyser-3", tier = 4, components = {}, fluids = true })
bfc({bldg = "electrolyser-4", tier = 5, components = {}, fluids = true })
bfc({bldg = "hydrazine-generator", tier = 5, components = {}, fluids = true })

-- Power Things
bfc({bldg = "large-accumulator", tier = 2, components = {{"battery-array", 10}, {"voltage-regulator", 2}} })
bfc({bldg = "fast-accumulator", tier = 2, components = {{"battery-array", 5}, {"voltage-regulator", 4}} })
bfc({bldg = "slow-accumulator", tier = 2, components = {{"battery-array", 5}, {"voltage-regulator", 1}} })
bfc({bldg = "large-accumulator-2", tier = 3, components = {{"li-battery-array", 10}, {"voltage-regulator", 2}} })
bfc({bldg = "fast-accumulator-2", tier = 3, components = {{"li-battery-array", 5}, {"voltage-regulator", 4}} })
bfc({bldg = "slow-accumulator-2", tier = 3, components = {{"li-battery-array", 5}, {"voltage-regulator", 1}} })
bfc({bldg = "large-accumulator-3", tier = 4, components = {{"li-battery-array", 10}, {"voltage-regulator", 2}} })
bfc({bldg = "fast-accumulator-3", tier = 4, components = {{"li-battery-array", 5}, {"voltage-regulator", 4}} })
bfc({bldg = "slow-accumulator-3", tier = 4, components = {{"li-battery-array", 5}, {"voltage-regulator", 1}} })

bfc({bldg = "solar-panel-small", tier = 2, components = {"photo-cell-array", "voltage-regulator"} })
bfc({bldg = "solar-panel-large", tier = 2, components = {{"photo-cell-array", 4}, "voltage-regulator"} })
bfc({bldg = "solar-panel-small-2", tier = 3, components = {"photo-cell-array", {"voltage-regulator", 2}} })
bfc({bldg = "solar-panel-2", tier = 3, components = {{"photo-cell-array", 2}, {"voltage-regulator", 2}} })
bfc({bldg = "solar-panel-large-2", tier = 3, components = {{"photo-cell-array", 4}, {"voltage-regulator", 2}} })
bfc({bldg = "solar-panel-small-3", tier = 4, components = {"photo-cell-array", {"voltage-regulator", 3}} })
bfc({bldg = "solar-panel-3", tier = 4, components = {{"photo-cell-array", 2}, {"voltage-regulator", 3}} })
bfc({bldg = "solar-panel-large-3", tier = 4, components = {{"photo-cell-array", 4}, {"voltage-regulator", 3}} })

bfc({bldg = "boiler-2", tier = 2, components = {{"burner-unit", 2}, {"boiler-component", 2}} })
bfc({bldg = "boiler-3", tier = 3, components = {{"burner-unit", 3}, {"boiler-component", 3}} })
bfc({bldg = "boiler-4", tier = 4, components = {{"burner-unit", 4}, {"boiler-component", 4}} })
bfc({bldg = "steam-engine-2", tier = 2, components = {{"industrial-engine", 2}, {"generator-coils", 2}} })
bfc({bldg = "steam-engine-3", tier = 3, components = {{"industrial-engine", 3}, {"generator-coils", 3}} })
bfc({bldg = "steam-turbine-2", tier = 2, components = {{"turbine-unit", 2}, {"generator-coils", 2}} })
bfc({bldg = "steam-turbine-3", tier = 3, components = {{"turbine-unit", 3}, {"generator-coils", 3}} })
bfc({bldg = "fluid-generator", tier = 2, components = {"fluid-injector", {"industrial-engine", 1}, {"generator-coils", 1}}, fluids = true })
bfc({bldg = "fluid-generator-2", tier = 3, components = {{"fluid-injector", 2}, {"industrial-engine", 2}, {"generator-coils", 2}}, fluids = true })
bfc({bldg = "fluid-generator-3", tier = 4, components = {{"fluid-injector", 3}, {"industrial-engine", 3}, {"generator-coils", 3}}, fluids = true })

-- Special Things
bfc({bldg = "beacon-2", tier = 2, components = {{"transmission-tower", 2}, {"effects-processing-unit", 2}} })
bfc({bldg = "beacon-3", tier = 3, components = {{"transmission-tower", 3}, {"effects-processing-unit", 3}} })
bfc({bldg = "lab-2", tier = 3, components = {{"adv-scipack-consumer", 2}, {"scanning-array", 2}} })
bfc({bldg = "lab-module", tier = 3, components = {"scipack-consumer", {"scanning-array", 1}} })
bfc({bldg = "radar-2", tier = 2, components = {{"transmission-tower", 2}, {"scanning-array", 2}} })
bfc({bldg = "radar-3", tier = 3, components = {{"transmission-tower", 3}, {"scanning-array", 3}} })
bfc({bldg = "radar-4", tier = 4, components = {{"transmission-tower", 4}, {"scanning-array", 4}} })
bfc({bldg = "radar-5", tier = 5, components = {{"transmission-tower", 5}, {"scanning-array", 5}} })

-- Storage Things
bfc({bldg = "storage-tank-1", tier = 1, components = {"fluid-tank"}, fluids = true})
bfc({bldg = "storage-tank-2", tier = 2, components = {{"fluid-tank", 2}}, fluids = true })
bfc({bldg = "storage-tank-3", tier = 3, components = {{"fluid-tank", 3}, {"reinforced-structure", 1}}, fluids = true })
bfc({bldg = "storage-tank-4", tier = 4, components = {{"fluid-tank", 4}, {"reinforced-structure", 2}}, fluids = true })

-- Other Things
bfc({bldg = "bob-greenhouse", tier = 2, components = {{"glass-dome", 2}, {"farm-bed", 2}}, fluids = true })
