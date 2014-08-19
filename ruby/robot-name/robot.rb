class Robot
  LETTERS = ('a'..'z').to_a.freeze
  private_constant :LETTERS

  attr_reader :name

  def initialize
    @name = '%s%s%03d' % [LETTERS.sample, LETTERS.sample, rand(100)]
  end

  def reset
    initialize
  end
end
