defmodule Acronym do
  import String
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string |> split_by_space_and_uppercase |> join_normalized
  end

  defp split_by_space_and_uppercase(string) do
    string |> replace(~r/([A-Z])/, " \\0") |> split
  end

  defp join_normalized(words) do
    words |> first_letters  |> upcase
  end

  defp first_letters(words) do
    Enum.map_join(words, fn(word) -> first(word) end)
  end
end
