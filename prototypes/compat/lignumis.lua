local khaoslib_recipe = require("__khaoslib__.recipe")

-- Ensure wood loader comes first
data.raw["item"]["mdrn-wood-loader"].order = "e[mdrn-loader]-00[mdrn-wood-loader]"

-- Fix up wood loader recipe to use burner inserters
khaoslib_recipe:load("mdrn-wood-loader")
  :replace_ingredient("inserter", function (ingredient)
    ingredient.name = "burner-inserter"
    return ingredient
  end)
  :commit()

-- Ensure loader underground/loader ingredients are consumed in pairs
khaoslib_recipe:load("mdrn-loader")
  :replace_ingredient("underground-belt", function (ingredient)
    ingredient.amount = 2
    return ingredient
  end)
  :replace_ingredient("mdrn-wood-loader", function (ingredient)
    ingredient.amount = 2
    return ingredient
  end)
  :commit()
