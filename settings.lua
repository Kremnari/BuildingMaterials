local setting = {
	type = "string-setting",
	name = "bm-burner-stage",
	setting_type = "startup",
	default_value = "basic automation",
	allowed_values = {"skip burner", "basic automation", "normal" },
}

if mods["aai-industry"] then
	setting.allowed_values[4] = "sp0"
end

data:extend({setting})