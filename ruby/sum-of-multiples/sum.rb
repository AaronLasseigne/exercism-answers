class SumOfMultiples
  class << self
    def to(number)
      new(3, 5).to(number)
    end
  end

  def initialize(*multiples)
    @multiples = multiples
  end

  def to(number)
    (3...number)
      .select { |n| multiple?(n) }
      .reduce(0, :+)
  end

  private def multiple?(number)
    @multiples.any? { |multiple| number % multiple == 0 }
  end
end
