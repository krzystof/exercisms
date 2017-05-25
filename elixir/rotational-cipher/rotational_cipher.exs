defmodule RotationalCipher do
  @alphabet 'abcdefghijklmnopqrstuvwxyz'

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> shifted(shift)
    |> to_string
  end

  defp shifted(letters, shift) do
    letters
    |> Enum.map(&shift_one(&1))
    |> Enum.map(&(Enum.at(@alphabet, &1 + shift)))
  end

  defp shift_one(letter) do
    Enum.find_index(@alphabet, &(&1 == letter))
  end
end
