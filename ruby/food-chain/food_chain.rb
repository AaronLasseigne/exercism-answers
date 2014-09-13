require 'pry'

class FoodChainSong
  LINES = [
    ['fly', "I don't know why she swallowed the fly. Perhaps she'll die.\n"],
    ['spider', 'It wriggled and jiggled and tickled inside her.'],
    ['bird', 'How absurd to swallow a bird!'],
    ['cat', 'Imagine that, to swallow a cat!'],
    ['dog', 'What a hog, to swallow a dog!'],
    ['goat', 'Just opened her throat and swallowed a goat!'],
    ['cow', "I don't know how she swallowed a cow!"],
    ['horse', "She's dead, of course!\n"]
  ]
  private_constant :LINES

  def verse(position)
    lines =
      if last_verse?(position)
        swallow_and_awe(LINES.last)
      else
        lines = (position - 1)
          .downto(1)
          .each_with_object(swallow_and_awe(LINES[position - 1])) do |p, lines|
            lines << swallowed_to_catch(LINES[p].first, LINES[p - 1].first)
          end

        unless first_verse?(position)
          lines << LINES.first.last
        end

        lines
      end

    lines.join("\n")
  end

  def verses(start, stop)
    start
      .upto(stop)
      .each_with_object([]) { |position, verses| verses << verse(position) }
      .join("\n") + "\n"
  end

  def sing
    verses(1, 8)
  end

  private def first_verse?(position)
    position == 1
  end

  private def last_verse?(position)
    position == LINES.size
  end

  private def swallowed(item)
    "I know an old lady who swallowed a #{item}."
  end

  private def swallowed_to_catch(predator, prey)
    "She swallowed the #{predator} to catch the #{prey}" +
      (prey == 'spider' ? ' that wriggled and jiggled and tickled inside her' : '') +
      '.'
  end

  private def swallow_and_awe(line)
    [
      swallowed(line.first),
      line.last
    ]
  end
end
