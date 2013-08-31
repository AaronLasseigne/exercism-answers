defmodule DNA do
  @nucleotides [?A, ?T, ?C, ?G]

  def count(chain, nucleotide) do
    Enum.count(chain, &1 == nucleotide)
  end

  def nucleotide_counts(chain) do
    HashDict.new @nucleotides, fn(nucleotide) ->
      {nucleotide, count(chain, nucleotide)}
    end
  end
end
