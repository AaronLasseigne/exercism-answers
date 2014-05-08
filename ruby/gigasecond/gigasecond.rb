require 'date'

class Gigasecond
  ONE_IN_SECONDS = 10**9
  private_constant :ONE_IN_SECONDS

  attr_reader :date

  def initialize(date)
    @date = (date.to_time + ONE_IN_SECONDS).to_date
  end
end
