class Grains
  def square(count)
    1 << (count - 1)
  end

  def total
    square(65) - 1
  end
end
