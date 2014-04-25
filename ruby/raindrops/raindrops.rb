class Raindrops
  TRANSLATIONS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }
  private_constant :TRANSLATIONS

  def self.convert(count)
    message = ''

    TRANSLATIONS.each do |(num, word)|
      message << word if count % num == 0
    end

    message.empty? ? count.to_s : message
  end
end
