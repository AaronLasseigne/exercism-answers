class Array
  def keep
    each_with_object([]) do |element, results|
      results << element if yield(element)
    end
  end

  def discard
    keep { |element| !yield(element) }
  end
end
