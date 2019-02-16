local techlib = bobmods.lib.tech

--tier 1

--tier 2
techlib.add_prerequisite("building-materials-tier-2", "angels-metallurgy-1")
techlib.add_prerequisite("building-materials-tier-2", "electronics")

--tier 3
techlib.add_prerequisite("building-materials-tier-3", "advanced-electronics")
techlib.add_prerequisite("building-materials-tier-3", "angels-stone-smelting-2")

--tier 4
techlib.add_prerequisite("building-materials-tier-4", "angels-advanced-chemistry-3")
techlib.add_prerequisite("building-materials-tier-4", "titanium-processing")

--tier 5
techlib.add_prerequisite("building-materials-tier-5", "advanced-electronics-2")
techlib.add_prerequisite("building-materials-tier-5", "advanced-oil-processing")
--techlib.add_prerequisite("building-materials-tier-5", "ceramics")
