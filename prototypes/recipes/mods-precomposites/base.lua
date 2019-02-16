--[[

	modifiers
	key = true or {item_name, amount }

tier_foci  very generalized
	a = framework
	b = paneling
	c = fasteners

--]]


buildM.generators.create_precomposite({ item="raw-wood", tier=0, tier_focus={"b", "a", "c"}, base_qty= 5,modifiers= {} } )
--buildM.generators.create_precomposite({ item="omniwood", tier=0, tier_focus={"b", "a", "c"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="stone", tier=0, tier_focus={"a", "c", "b"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="iron-plate", tier=0, tier_focus={"c", "b", "a"}, base_qty= 5,modifiers= {} } )

buildM.generators.create_precomposite({ item="wood", tier=1, tier_focus={"b", "a", "c"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="stone-brick", tier=1, tier_focus={"a", "b", "c"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="iron-stick", tier=1, tier_focus={"c", "b", "a"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="copper-plate", tier=1, tier_focus={"b", "c", "a"}, base_qty= 5,modifiers= {} } )

buildM.generators.create_precomposite({ item="stone-brick", tier=2, tier_focus={"a", "b", "c"}, base_qty= 5, modifiers= { enhancer={item_name="repair-pack", amount=2}} } )
buildM.generators.create_precomposite({ item="iron-stick", tier=2, tier_focus={"c", "b", "a"}, base_qty= 5, modifiers= { enhancer={item_name="repair-pack", amount=2}} } )
buildM.generators.create_precomposite({ item="concrete", tier=2, tier_focus={"a", "b", "c"}, base_qty= 5, modifiers= {} } )
buildM.generators.create_precomposite({ item="steel-plate", tier=2, tier_focus={"a", "b", "c"}, base_qty= 5, modifiers= {} } )

buildM.generators.create_precomposite({ item="glass", tier=3, tier_focus={"b", "a", "c"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="refined-concrete", tier=3, tier_focus={"a", "b", "c"}, base_qty= 5,modifiers= {} } )
buildM.generators.create_precomposite({ item="plastic-bar", tier=3, tier_focus={"c", "b", "a"}, base_qty= 5,modifiers= {} } )




