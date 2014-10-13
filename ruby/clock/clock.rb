class Clock
  MIN_PER_HOUR = 60
  HOURS_PER_DAY = 24
  private_constant :MIN_PER_HOUR, :HOURS_PER_DAY

  class << self
    alias_method :at, :new
  end

  def initialize(hour, min = 0)
    @hour, @min = hour, min

    resolve_time
  end

  def +(minutes)
    self.class.new(@hour, @min + minutes)
  end

  def -(minutes)
    self + -minutes
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    format('%02d:%02d', @hour, @min)
  end

  private def resolve_time
    @hour += (@min / MIN_PER_HOUR)
    @hour %= HOURS_PER_DAY

    @min %= MIN_PER_HOUR
  end
end
