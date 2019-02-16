local bfc = buildM.updater.bldg_from_components
local skip = buildM.updater.skip_building
--aai
bfc({bldg = "burner-assembling-machine", tier = 0, components = {"burner-unit", "boiler-component"}})
bfc({bldg = "burner-turbine", tier = 0, components = {"burner-unit", "basic-turbine", "generator-coils"}})
bfc({bldg = "burner-turbine-generator", tier = 0, components = {"burner-unit", "basic-turbine", "generator-coils"}})
bfc({bldg = "fuel-processor", tier = 1, components = {"burner-unit", "boiler-component"}})

--sci cost tweaker
if mods["ScienceCostTweakerM"] then
	bfc({bldg = "lab", tier = 1, components = {"sct-lab1-mechanization"}, material = "sct-lab1-construction" })
	bfc({bldg = "sct-lab-1", tier = 1, components = {"sct-lab1-mechanization"}, material = "sct-lab1-construction" })
	bfc({bldg = "sct-lab-2", tier = 2, components = {"sct-lab1-mechanization", "sct-lab2-automatization"}, material = "sct-lab2-construction" })
	bfc({bldg = "sct-lab-3", tier = 3, components = {"sct-lab1-mechanization", "sct-lab2-automatization", "sct-lab3-optics"}, material = "sct-lab3-construction" })
	bfc({bldg = "sct-lab-4", tier = 4, components = {"sct-lab2-automatization", "sct-lab3-optics", "sct-lab4-manipulators"}, material = "sct-lab4-construction" })
end

--factorissimo
--bfc({bldg = "factory-1", tier = 2, components = {"burner-unit", "boiler-component"}})
--bfc({bldg = "factory-2", tier = 3, components = {"burner-unit", "boiler-component"}})
--bfc({bldg = "factory-3", tier = 4, components = {"burner-unit", "boiler-component"}})
buildM.updater.skip_building("factory-circuit-input")
buildM.updater.skip_building("factory-port-marker")
buildM.updater.skip_building("factory-input-pipe")
buildM.updater.skip_building("factory-output-pipe")

--clowns
bfc({bldg = "sluicer", tier = 1, components = {"burner-unit", "boiler-component"}})
bfc({bldg = "centrifuge-mk2", tier = 3, components = {{"weight-balance", 2}, {"heavy-duty-motor", 2}} })
bfc({bldg = "centrifuge-mk3", tier = 4, components = {{"weight-balance", 3}, {"heavy-duty-motor", 3}} })
