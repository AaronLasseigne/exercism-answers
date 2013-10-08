defmodule Phone do
  @bad_number "0000000000"

  def number(digits) do
    digits = scrub_formatting(digits)

    cond do
      String.length(digits) == 10 ->
        digits
      String.length(digits) == 11 && valid_country_code?(digits) ->
        remove_country_code(digits)
      true ->
        @bad_number
    end
  end

  def pretty(digits) do
    "(#{area_code(digits)}) #{exchange(digits)}-#{suffix(digits)}"
  end

  def area_code(digits), do: number(digits) |> String.slice(0, 3)

  defp exchange(digits), do: number(digits) |> String.slice(3, 3)

  defp suffix(digits), do: number(digits) |> String.slice(6, 4)

  defp valid_country_code?(digits), do: String.starts_with?(digits, "1")

  defp remove_country_code(digits), do: String.slice(digits, 1, 10)

  defp scrub_formatting(digits), do: Regex.replace(%r/\D+/, digits, "")
end
