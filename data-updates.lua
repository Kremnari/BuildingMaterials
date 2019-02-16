--[[
	usage example,
	keep components to 3 or less
	buildM.updater.bldg_from_components({bldg="assembling-machine-1", components={"iron-plate", "stone"}})
--]]


--[[
	All recipe changes are indexed and the current data.raw.recipe list is checked against it
	Any mods not loaded will not cause nil references this way
--]]

require("prototypes/recipes/mods-precomposites/base")
require("prototypes/recipes/mods-components/base")
require("prototypes/recipes/mods-buildings/base")


require("prototypes/recipes/mods-precomposites/bobs")
require("prototypes/recipes/mods-components/bobs")
require("prototypes/recipes/mods-buildings/bobs")

require("prototypes/recipes/mods-precomposites/angels")
require("prototypes/recipes/mods-components/angels")
require("prototypes/recipes/mods-buildings/angels")

require("prototypes/recipes/mods-precomposites/omni")
require("prototypes/recipes/mods-components/omni")
require("prototypes/recipes/mods-buildings/omni")

require("prototypes/recipes/mods-components/others")
require("prototypes/recipes/mods-buildings/bio-industries")
require("prototypes/recipes/mods-buildings/npbees")
require("prototypes/recipes/mods-buildings/others")