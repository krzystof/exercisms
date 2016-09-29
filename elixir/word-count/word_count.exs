defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Map.new(remove_special_chars(sentence), fn x ->
      { x, occurences_in(x, remove_special_chars(sentence)) }
    end)
  end

  defp occurences_in(needle, haystack) do
    Enum.count(haystack, fn(item) -> item == needle end)
  end

  defp remove_special_chars(sentence) do
    String.replace(sentence, ~r/[!_,&@$%^:\s]/, " ") |> String.downcase |> String.split
  end
end
