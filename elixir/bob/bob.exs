defmodule Teenager do
  def hey(message) do
    message = String.strip(message || "")

    cond do
      silent?(message) ->
        "Fine. Be that way!"
      shouting?(message) ->
        "Woah, chill out!"
      asking?(message) ->
        "Sure."
      true ->
        "Whatever."
    end
  end

  defp shouting?(message) do
    message == String.upcase(message)
  end

  defp asking?(message) do
    String.ends_with?(message, "?")
  end

  defp silent?(message) do
    message == ""
  end
end
