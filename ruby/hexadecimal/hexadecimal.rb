class Hexadecimal
  def initialize(number)
    @number = number
  end

  def to_decimal
    @to_decimal ||= begin
      return 0 if @number =~ /[^0-9a-f]/

      @number.chars.reduce(0) do |decimal, digit|
        (decimal * 16) + digit_to_decimal(digit)
      end
    end
  end

  private def digit_to_decimal(digit)
    {
      a: 10,
      b: 11,
      c: 12,
      d: 13,
      e: 14,
      f: 15
    }.fetch(digit.to_sym) { Integer(digit) }
  end
end
