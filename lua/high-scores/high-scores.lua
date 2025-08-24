local HighScores = {}

function HighScores:scores()
  return self
end

function HighScores:latest()
  return self[#self]
end

function HighScores:personal_best()
  return math.max(table.unpack(self))
end

function HighScores:personal_top_three()
  local sorted = { table.unpack(self) }
  table.sort(sorted, function(a, b) return a > b end)
  return table.move(sorted, 1, 3, 1, {})
end

return function(scores)
  local high_scores = {}
  setmetatable(high_scores, { __index = HighScores })

  for position, score in pairs(scores) do
    table.insert(high_scores, position, score)
  end

  return high_scores
end
