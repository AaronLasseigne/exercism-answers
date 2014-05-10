class School
  def initialize
    @roster = Hash.new { |h, k| h[k] = [] }
  end

  def add(name, level)
    @roster[level] << name
  end

  def grade(level)
    @roster[level].sort
  end

  def to_hash
    @roster.keys.sort.each_with_object({}) do |level, h|
      h[level] = grade(level)
    end
  end
end
