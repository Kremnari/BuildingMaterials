buildM.updater.bldg_from_components = function(rec_data)
	if not rec_data.bldg then
		log("BM: tried to set components for a building, but didn't pass which building")
		return false
	end
	if not rec_data.components then
		log("BM: tried to set components for "..rec_data.bldg.." but you didn't tell me which components")
		return false
	end
	if not rec_data.tier then
		--log("BM: I need a tier level for "..rec_data.bldg.." the moment please."
		rec_data.tier = 1 -- lookup
		
	end
	local components = {}
	for _, each in pairs(rec_data.components) do
		if each.name then
			if not data.raw.item[each.name] then
				log("BM: tried to set a component for "..rec_data.bldg.." but the component "..each.name.."doesn't exist yet")
				return false
			end
			components[each.name] = (components[each.name] or 0) + each.amount
		elseif type(each) == 'table' then
			if not data.raw.item[each[1]] then
				log("BM: tried to set a component for "..rec_data.bldg.." but the component "..each[1].."doesn't exist yet")
				return false
			end
			components[each[1]] = (components[each[1]] or 0) + each[2]
		else
			if not data.raw.item[each] then
				log("BM: tried to set a component for "..rec_data.bldg.." but the component "..each.."doesn't exist yet")
				return false
			end
			components[each] = (components[each] or 0) + 1
		end
	end
	--FIXME
	--[[if #components > 3 then
		log("BM: too many components for "..rec_data.bldg..".  Try keeping it under three.  I will truncate that for you")
		table.setn(components, 3)
	end
	--]]
	if buildM.updater.use_components[rec_data.bldg] then
		log("BM: overwriting building components of "..rec_data.bldg)
	end
	buildM.updater.use_components[rec_data.bldg] = {components=components, uses_fluids=(rec_data.fluids or false), tier = rec_data.tier, material = rec_data.material}
end
