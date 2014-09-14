class Sieve
  def initialize(upper_bound)
    @upper_bound = upper_bound
  end

  def primes
    return @primes if defined?(@primes)

    @primes = [nil, nil, *2..@upper_bound]

    possible_primes do |number|
      next unless @primes[number]

      multiples(number) do |multiple|
        @primes[multiple] = nil
      end
    end

    @primes.compact
  end

  private

  def possible_primes(&block)
    2.upto(Math.sqrt(@upper_bound), &block)
  end

  def multiples(number, &block)
    ((number ** 2)..@upper_bound).step(number, &block)
  end
end
