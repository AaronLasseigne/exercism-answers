class Bob
  def hey(message)
    message = message.to_s.strip

    [
      Silent,
      Shout,
      Ask,
      State
    ].find { |type| type.describes?(message) }.response
  end
end

class MessageType
  def self.describes?(message)
    raise NotImplementedError
  end

  def self.response
    raise NotImplementedError
  end
end

class Silent < MessageType
  def self.describes?(message)
    message == ''
  end

  def self.response
    'Fine. Be that way!'
  end
end

class Shout < MessageType
  def self.describes?(message)
    message == message.upcase
  end

  def self.response
    'Woah, chill out!'
  end
end

class Ask < MessageType
  def self.describes?(message)
    message =~ /\?\z/
  end

  def self.response
    'Sure.'
  end
end

class State < MessageType
  def self.describes?(message)
    true
  end

  def self.response
    'Whatever.'
  end
end
