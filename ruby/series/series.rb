class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(length)
    if length > @digits.length
      fail ArgumentError, 'slice length cannot be greater than the length of the series'
    end

    @digits
      .chars
      .map(&:to_i)
      .each_cons(length)
      .to_a
  end
end
