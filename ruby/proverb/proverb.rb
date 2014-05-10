class Proverb
  def initialize(*nouns, qualifier: '')
    @nouns = nouns
    @qualifier = qualifier
  end

  def to_s
    @to_s ||= sentences(@nouns).push(conclusion(@nouns.first)).join("\n")
  end

  private

  def sentence(a, b)
    "For want of a #{a} the #{b} was lost."
  end

  def sentences(nouns)
    nouns.each_cons(2).map { |a, b| sentence(a, b) }
  end

  def conclusion(noun)
    "And all for the want of a #{qualified(noun)}."
  end

  def qualified(noun)
    "#{@qualifier} #{noun}".strip
  end
end
