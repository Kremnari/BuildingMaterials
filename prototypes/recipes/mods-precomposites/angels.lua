-- If you feel that these require tweaking, just use the same item,tier and modifiers,
-- else you can use buildM.generators.nil_precomposite with that data
-- the functions are in precomposites.lua

buildM.generators.create_precomposite({ item="angels-roll-iron", tier=2, tier_focus={"b", "a", "c"}, base_qty= 5, modifiers= { refined=true } } )
buildM.generators.create_precomposite({ item="clay-brick", tier=2, tier_focus={"a", "b", "c"}, base_qty= 5,} )

buildM.generators.create_precomposite({ item="concrete-brick", tier=3, tier_focus={"a", "b", "c"}, base_qty= 5, } )
buildM.generators.create_precomposite({ item="glass", tier=3, tier_focus={"b", "a", "c"}, base_qty= 5 } )
buildM.generators.create_precomposite({ item="angels-roll-steel", tier=3, tier_focus={"b", "a", "c"}, base_qty= 5, modifiers= { refined=true } } )

buildM.generators.create_precomposite({ item="reinforced-concrete-brick", tier=4, tier_focus={"a", "b", "c"}, base_qty= 5, modifiers= { refined=true } } )
buildM.generators.create_precomposite({ item="angels-roll-aluminium", tier=4, tier_focus={"b", "a", "c"}, base_qty= 5, modifiers= { refined=true } } )
buildM.generators.create_precomposite({ item="fibre-glass", tier=4, tier_focus={"b", "a", "c"}, base_qty= 5, } )
