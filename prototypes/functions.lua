buildM.updater.skipList  = {}
buildM.updater.use_components = {}

buildM.updater.skip_recipe = function(which)
	buildM.updater.skipList[which] = true
end

buildM.updater.skip_building = function(which)
	local recipe = buildM.researcher.getRecipeFor(which)
	if recipe then
		--log("skipping "..recipe)
		buildM.updater.skipList[recipe] = true
	end
end

buildM.researcher.findTechUnlock = function(recipe)
	for _,each in pairs(data.raw.technology) do
		if each.effects then
			for _, effect in pairs(each.effects) do
				if effect.type == "unlock-recipe" then
					if effect.recipe == recipe then
						return each.name
					end
				end
			end
		end
	end
	return nil
end

buildM.researcher.findTechLevel = function(recipe)
	local tech = buildM.researcher.findTechUnlock(recipe)
	if not tech then
		return 0
	end
	local sci_packs = {}
	--Should be unlocked at start
	local count = #data.raw.technology[tech].unit.ingredients
	if data.raw.tool["science-pack-0"] then
		count = count-1
	end
	count = math.max(count, 0)
	return math.min(count,5)
end

buildM.researcher.getRecipeFor = function(entity_name)
	if data.raw.recipe[entity_name] then
		return entity_name
	end
	-- data.raw.item find by *.place_result
	for name,props in pairs(data.raw.recipe) do
		if props.result and props.result.name == entity_name then
			return name
		elseif props.results then
			for _,each in pairs(props.results) do
				if each.name == entity_name then
					return name
				end
			end
		elseif props.normal then
			if props.normal.result and props.normal.result.name == entity_name then
				return name
			elseif props.normal.results then
				for _,each in pairs(props.normal.results) do
					if each.name == entity_name then
						return name
					end
				end
			end
		end
	end
	buildM.log("bm- search more for recipe:"..entity_name)
end

function buildM.researcher.getMainProduct_of(recipe)
	local ret = ''

	--log("gmp: "..serpent.block(recipe))
	if recipe.normal then
		if recipe.normal.main_product then ret = recipe.normal.main_product
		elseif recipe.normal.results then ret = recipe.normal.results[1].name
		elseif recipe.normal.result then ret = recipe.normal.result
		end
	else
		if recipe.main_product then ret = recipe.main_product
		elseif recipe.results then ret = recipe.results[1].name
		elseif recipe.result then ret = recipe.result
		end
	end
	--log("returning: "..ret.." of "..serpent.block(recipe))
	return ret
end

buildM.researcher.entity_list = {}

function buildM.researcher.build_entity_list(categories)
	for _,cat in pairs(categories) do
		for _,item in pairs(data.raw[cat]) do
			buildM.researcher.entity_list[item.name] = true
		end
	end
end
