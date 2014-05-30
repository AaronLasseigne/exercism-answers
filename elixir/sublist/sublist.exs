defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b ->
        :equal
      contains?(a, b) ->
        :superlist
      contains?(b, a) ->
        :sublist
      true ->
        :unequal
    end
  end

  defp contains?(full, sub) do
    sub_count = Enum.count(sub)

    cond do
      sub_count > Enum.count(full) ->
        false
      Enum.take(full, sub_count) === sub ->
        true
      true ->
        [_ | t] = full
        contains?(t, sub)
    end
  end
end
