defmodule Beer do
  def verse(bottles) do
    first_line(bottles) <> second_line(bottles)
  end

  def sing(beginning, ending // 0) when beginning == ending do
    verse(beginning) <> "\n"
  end
  def sing(beginning, ending) do
    Enum.join([verse(beginning), sing(beginning - 1, ending)], "\n")
  end

  defp first_line(remaining) do
    "#{String.capitalize(bottles(remaining))} of beer on the wall, #{bottles(remaining)} of beer.\n"
  end

  defp second_line(remaining) do
    line = if remaining == 0 do
      "Go to the store and buy some more"
    else
      noun = if remaining == 1, do: 'it', else: 'one'

      "Take #{noun} down and pass it around"
    end

    "#{line}, #{bottles(if remaining == 0, do: 99, else: remaining - 1)} of beer on the wall.\n"
  end

  defp bottles(0),         do: "no more bottles"
  defp bottles(1),         do: "1 bottle"
  defp bottles(remaining), do: Enum.join([remaining, "bottles"], " ")
end
