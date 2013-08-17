defmodule Anagram do
  def match(subject, words) do
    Enum.filter(words, anagram?(subject, &1))
  end

  defp anagram?(subject, word) do
    normalize(subject) == normalize(word)
  end

  defp normalize(word) do
    Regex.scan(%r/./, word)
    |> List.flatten
    |> Enum.sort
    |> Enum.join
  end
end
