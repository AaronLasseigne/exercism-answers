defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"]}, "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  def transform(input) do
    Enum.reduce input, %{}, fn({key, values}, acc) ->
      values
      |> downcase
      |> map_to_key(key)
      |> Map.merge(acc)
    end
  end

  defp map_to_key(values, key) do
    Enum.reduce values, %{}, fn(value, acc) ->
      Map.put(acc, value, key)
    end
  end

  defp downcase(values) do
    Enum.map(values, &String.downcase/1)
  end
end
