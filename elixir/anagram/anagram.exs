defmodule Anagram do
  def match(subject, words) do
    normalized_subject = normalize(subject)

    Enum.filter(words, anagram?(normalized_subject, &1))
  end

  defp anagram?(normalized_subject, word) do
    normalized_subject == normalize(word)
  end

  defp normalize(word) do
    String.codepoints(word)
    |> Enum.sort
  end
end
