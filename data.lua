buildM = {
	generators = {},
	updater = {},
	researcher = {},
	general = {},
	links = {}
}

buildM.log = function(what)
	log(what)
end

require("util/inter-mods")
require("util/icons")
require("prototypes/functions")
require("prototypes/groups")
require("prototypes/technologies/start")
require("prototypes/machine-shops")
require("prototypes/items/precomposites")
require("prototypes/items/materials")
require("prototypes/recipes/precomposites")
require("prototypes/recipes/materials")
require("prototypes/recipes/buildings")
require("prototypes/recipes/cncs")
require("prototypes/recipes/components")


buildM.settings = {}
buildM.settings.burner_handling = settings.startup["bm-burner-stage"].value
log("bh: "..buildM.settings.burner_handling)

--for _,each in pairs(data.raw.item) do
--	log("BM item: "..each.name)
--end

--[[

before development I had intended "components" to make materials
during development, I decided to add "components" as an ingredient category
	to buildings
	as such, I changed the ingredients of materials to "precomposites"
	although not all code will reflect this.
--]]