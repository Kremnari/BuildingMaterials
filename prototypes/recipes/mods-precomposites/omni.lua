local cpc = buildM.generators.create_precomposite

cpc({ item="omniwood", tier=0, tier_focus={"b", "a", "c"}, base_qty= 5 } )
--cpc({ item="omni-wood", tier=0, tier_focus={"b", "a", "c"}, base_qty= 5 } )

--log(serpent.block(data.raw.recipe["omniwood-building-components-0"].icons))