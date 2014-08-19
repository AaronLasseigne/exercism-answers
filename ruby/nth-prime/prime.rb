require 'prime'

class Prime
  def self.nth(count)
    fail ArgumentError, 'must be positive' if count < 1

    take(count).last
  end
end
