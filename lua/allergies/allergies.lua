local ALLERGIES = {
  eggs         = 1,
  peanuts      = 2,
  shellfish    = 4,
  strawberries = 8,
  tomatoes     = 16,
  chocolate    = 32,
  pollen       = 64,
  cats         = 128,
}

local function allergic_to(score, which)
  return score & ALLERGIES[which] ~= 0
end

local function list(score)
  local result = {}
  for allergen, _ in pairs(ALLERGIES) do
    if allergic_to(score, allergen) then
      table.insert(result, allergen)
    end
  end
  table.sort(result, function(a, b) return ALLERGIES[a] < ALLERGIES[b] end)
  return result
end

return { list = list, allergic_to = allergic_to }
