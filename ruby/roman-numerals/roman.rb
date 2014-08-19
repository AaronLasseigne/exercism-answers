module RomanNumerals
  CONVERSIONS = {
    1000 => 'M',
    900  => 'CM',
    500  => 'D',
    400  => 'CD',
    100  => 'C',
    90   => 'XC',
    50   => 'L',
    40   => 'XL',
    10   => 'X',
    9    => 'IX',
    5    => 'V',
    4    => 'IV',
    1    => 'I'
  }.freeze
  private_constant :CONVERSIONS

  def to_roman
    total = self

    CONVERSIONS.each_with_object('') do |(number, letter), output|
      count = total / number
      total -= number * count

      output << letter * count
    end
  end
end

class Fixnum
  include RomanNumerals
end
