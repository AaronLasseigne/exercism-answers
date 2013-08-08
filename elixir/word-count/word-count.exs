defmodule Words do
  def count(text) do
    count(text, HashDict.new)
  end
  defp count(text, tally) do
    case next_word(text) do
      {:ok, word, nil} ->
        mark(tally, word)
      {:ok, word, rest} ->
        mark(count(rest, tally), word)
      nil ->
        tally
    end
  end

  defp next_word(nil), do: nil
  defp next_word(text) do
    [word | rest] = String.split(text, %r/[[:^alnum:]]+/u, global: false)

    rest = Enum.first(rest)

    if word == "" do
      next_word(rest)
    else
      {:ok, word, rest}
    end
  end

  defp mark(tally, word) do
    HashDict.update tally, normalize(word), 1, fn(marks) ->
      marks + 1
    end
  end

  defp normalize(word) do
    String.downcase(word)
  end
end
