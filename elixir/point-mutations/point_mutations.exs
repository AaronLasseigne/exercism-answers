defmodule DNA do
  def hamming_distance(strand, other) do
    [strand, other]
    |> List.zip
    |> List.foldl 0, fn (nucleotides, difference) ->
      difference + if matching_pair?(nucleotides), do: 0, else: 1
    end
  end

  defp matching_pair?(nucleotides) do
    elem(nucleotides, 0) == elem(nucleotides, 1)
  end
end
