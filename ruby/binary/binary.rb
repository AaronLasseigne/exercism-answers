class Binary
  def initialize(number)
    @number = number
  end

  def to_decimal
    @to_decimal ||= begin
      return 0 if @number =~ /[^01]/

      sum = 0
      @number
        .reverse
        .each_char.with_index do |digit, i|
          sum += Integer(digit) * 2**i
        end
      sum
    end
  end
end
