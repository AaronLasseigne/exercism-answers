defmodule DNA do
  def hamming_distance(strand, other) do
    hamming_distance(strand, other, 0)
  end
  defp hamming_distance(_ , '', difference), do: difference
  defp hamming_distance('', _ , difference), do: difference
  defp hamming_distance(strand, other, difference) do
    [nucleotide1 | rest_of_strand] = strand
    [nucleotide2 | rest_of_other]  = other

    count = difference + if nucleotide1 == nucleotide2, do: 0, else: 1

    hamming_distance(rest_of_strand, rest_of_other, count)
  end
end
