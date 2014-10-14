defmodule Words do
  def count(text) do
    List.foldl(words(text), HashDict.new, &mark/2)
  end

  defp words(text) do
    List.flatten(Regex.scan(%r/[[:alnum:]]+/u, normalize(text)))
  end

  defp mark(word, tally) do
    HashDict.update(tally, word, 1, &1 + 1)
  end

  defp normalize(word) do
    String.downcase(word)
  end
end
