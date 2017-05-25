defmodule RotationalCipher do
  @alphabet 'abcdefghijklmnopqrstuvwxyz'

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> Enum.map(&shift_letter(&1, shift))
    |> to_string
  end

  defp shift_letter(letter, 26) do letter end
  defp shift_letter(letter, shift) do
    index = Enum.find_index(@alphabet, &(&1 == letter))
    new_index = Kernel.rem(index + shift, 26)
    Enum.at(@alphabet, new_index)
  end
end
