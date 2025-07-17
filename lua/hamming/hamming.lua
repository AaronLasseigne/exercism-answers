local Hamming = {}

function Hamming.compute(a, b)
  if #a ~= #b then
    error('strands must be of equal length', 2)
  end

  local count = 0
  for i = 1, #a do
    if a:sub(i, i) ~= b:sub(i, i) then
      count = count + 1
    end
  end

  return count
end

return Hamming
