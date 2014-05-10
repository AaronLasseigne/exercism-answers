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
    @roster.sort.each_with_object({}) do |(level, names), h|
      h[level] = names.sort
    end
  end
end
