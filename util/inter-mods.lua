if mods["omnimatter_compression"] then
	buildM.links.omni_compress_exclude = function(recipe)
		omni.compression.exclude_recipe(recipe)
	end
else
	buildM.links.omni_compress_exclude = function(recipe)
	end
end

if mods["omnilib"] then
	buildM.links.omni_standard = function(recipe)
		omni.marathon.standardise(recipe)
	end
else
	buildM.links.omni_standard = function(recipe)
		if not recipe.normal then
			local form = {
				ingredients = table.deepcopy(recipe.ingredients),
				energy = recipe.energy,
				enabled = recipe.enabled,
			}
			if recipe.results then
				form.results = table.deepcopy(recipe.results)
			else
				form.results = { {type="item", name=recipe.result, amount=1} }
			end
			recipe.normal = table.deepcopy(form)
			recipe.expensive = table.deepcopy(form)
		end
	end
end