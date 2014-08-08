class Squares
  def initialize(count)
    @numbers = 0.upto(count)
  end

  def sum_of_squares
    @sum_of_squares ||= numbers.reduce { |sum, number| sum + (number ** 2) }
  end

  def square_of_sums
    @square_of_sums ||= numbers.reduce(:+) ** 2
  end

  def difference
    square_of_sums - sum_of_squares
  end

  private

  attr_reader :numbers
end
