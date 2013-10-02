defmodule DNA do
  def hamming_distance(strand, other) do
    [strand, other]
    |> List.zip
    |> Enum.count &non_matching_pair?/1
  end

  defp non_matching_pair?(nucleotides) do
    elem(nucleotides, 0) != elem(nucleotides, 1)
  end
end
