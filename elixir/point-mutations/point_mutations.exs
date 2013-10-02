defmodule DNA do
  def hamming_distance(strand, other) do
    [strand, other]
    |> List.zip
    |> Enum.count &non_matching_pair?/1
  end

  defp non_matching_pair?({a, b}), do: a != b
end
