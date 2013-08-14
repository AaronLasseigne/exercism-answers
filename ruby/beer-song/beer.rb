class Beer
  def verse(number)
    Verse.new(number).to_s
  end

  def sing(beginning, ending = 0)
    verses(beginning, ending).join("\n") + "\n"
  end

  private

  def verses(beginning, ending)
    beginning.downto(ending).map do |number|
      Verse.new(number).to_s
    end
  end

  class Verse
    def initialize(number)
      @remaining = number
    end

    def to_s
      "#{first_line}\n#{second_line}\n"
    end

    private

    attr_reader :remaining

    def first_line
      "#{bottles(remaining).capitalize} of beer on the wall, #{bottles(remaining)} of beer."
    end

    def second_line
      line =
        if out?
          'Go to the store and buy some more'
        else
          "Take #{last_one? ? 'it' : 'one'} down and pass it around"
        end

      line << ", #{bottles(remaining - 1)} of beer on the wall."
    end

    def out?
      remaining.zero?
    end

    def last_one?
      remaining == 1
    end

    def bottles(remaining)
      case remaining
      when -1
        '99 bottles'
      when 0
        'no more bottles'
      when 1
        '1 bottle'
      else
        "#{remaining} bottles"
      end
    end
  end
end
