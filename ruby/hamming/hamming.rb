class Hamming
  def self.compute(a, b)
    a = a.split('')
    b = b.split('')

    a, b = b, a if b.size < a.size

    a.zip(b).count { |x, y| x != y }
  end
end
