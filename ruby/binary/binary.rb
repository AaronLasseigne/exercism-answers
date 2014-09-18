class Binary
  def initialize(number)
    @number = number
  end

  def to_decimal
    @to_decimal ||= begin
      return 0 if @number =~ /[^01]/

      @number.chars.reduce(0) do |decimal, digit|
        (decimal * 2) + Integer(digit)
      end
    end
  end
end
