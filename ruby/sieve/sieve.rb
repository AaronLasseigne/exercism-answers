class Sieve
  def initialize(upper_bound)
    @upper_bound = upper_bound
  end

  def primes
    return @primes if defined?(@primes)

    numbers = (2..@upper_bound).to_a
    @primes = []

    while numbers.size > 0
      @primes << (divisor = numbers.shift)

      numbers.reject! do |number|
        number % divisor == 0
      end
    end

    @primes
  end
end
