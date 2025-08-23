local ArmstrongNumbers = {}

function ArmstrongNumbers.is_armstrong_number(number)
  local number_as_str = tostring(number)
  local length = #number_as_str

  local sum = 0;
  for i = 1, length do
    local digit = tonumber(number_as_str:sub(i, i))
    if digit then
      sum = sum + (digit ^ length)
    end
  end

  return sum == number
end

return ArmstrongNumbers
