local all_your_base = {}

local MIN_BASE = 2

local function to_decimal(digits, base)
  assert(base >= MIN_BASE, 'invalid input base')

  local number = 0
  for i, digit in ipairs(digits) do
    assert(digit >= 0, 'negative digits are not allowed')
    assert(digit < base, 'digit out of range')

    number = number + (digit * (base ^ (#digits - i)))
  end

  return number
end

local function from_decimal(number, base)
  assert(base >= MIN_BASE, 'invalid output base')

  local digits = {}
  while number > 0 do
    table.insert(digits, 1, number % base)
    number = number // base
  end

  if #digits == 0 then
    table.insert(digits, 0)
  end

  return digits
end

all_your_base.convert = function(from_digits, from_base)
  local decimal = to_decimal(from_digits, from_base)

  return {
    to = function(to_base)
      return from_decimal(decimal, to_base)
    end
  }
end

return all_your_base
