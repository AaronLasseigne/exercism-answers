class Crypto
  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    @normalize_plaintext ||= @message.downcase.delete("^0-9a-z")
  end

  def size
    @size ||= Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    @plaintext_segments ||= groups_of(normalize_plaintext, size)
  end

  def ciphertext
    @ciphertext ||= size.times.with_object('') do |i, text|
      text << plaintext_segments.map { |segment| segment[i] }.join
    end
  end

  def normalize_ciphertext
    @normalize_ciphertext ||= groups_of(ciphertext, 5).join(' ')
  end

  private def groups_of(text, count)
    text.scan(/.{1,#{count}}/)
  end
end
