-- I hold icon data for what may or may not have icons yet

buildM.general.icons = {}
buildM.general.icon_colors = {"yellow", "red", "blue", "black", "pink", "green", "white", "cyan", "grey", }
buildM.general.get_iconset_by_name = function(name, tier)
	if buildM.general.icons[name] then return buildM.general.icons[name] end
	local icons = {}
	if tier then
		icons[1] = { icon = "__base__/graphics/icons/signal/signal_"..buildM.general.icon_colors[tier]..".png" }
	else
		icons[1] = { icon = "__Building_Materials__/graphics/icons/unknown.png" }
	end
	local pos = 1
	local poses = { {-7, -10}, {7, -10}, {-7, 10}, {7, 10},}
	for letter in name:gmatch("[^-]+") do
		if pos < 5 then
			icons[#icons+1] = { icon = "__base__/graphics/icons/signal/signal_"..string.upper(letter:sub(1,1))..".png", scale = 0.5, shift = poses[pos] }
			pos = pos + 1
		end
	end
	return icons
end

local ics = buildM.general.icons
local base = "__Building_Materials__/graphics/icons/components/"

ics["burner-unit-0"] = {{icon = base.."burner-unit-0.png" }}
ics["burner-unit"] = {{icon = base.."burner-unit.png" }}
ics["boiler-component"] = {{icon = base.."boiler-component.png" }}
ics["generator-coils"] = {{icon = base.."generator-coils.png" }}