class PrimeFactors
  class << self
    def for(number)
      divisors = []
      divisor = 2

      while number > 1
        if number % divisor == 0
          number /= divisor
          divisors << divisor
        else
          divisor += 1
        end
      end

      divisors
    end
  end
end
