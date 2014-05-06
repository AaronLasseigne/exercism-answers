class ETL
  def self.transform(data)
    data.each_with_object({}) do |(score, letters), h|
      letters.each do |letter|
        h[letter.downcase] = score
      end
    end
  end
end
