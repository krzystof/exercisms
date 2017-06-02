defmodule RotationalCipher do
  @lowcase_alphabet 'abcdefghijklmnopqrstuvwxyz'
  @upcase_alphabet 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> shift_all_by(shift)
    |> to_string
  end

  defp shift_all_by([], _shift) do [] end
  defp shift_all_by([ head | tail ], shift) do
     [ shift_letter(head, shift) | shift_all_by(tail, shift) ]
  end

  defp shift_letter(letter, 26) do letter end
  defp shift_letter(letter, shift) do
    cond do
      Enum.member?(@lowcase_alphabet, letter) ->
        shift_in_list(@lowcase_alphabet, letter, shift)
      Enum.member?(@upcase_alphabet, letter) ->
        shift_in_list(@upcase_alphabet, letter, shift)
      True ->
        letter
    end
  end

  defp shift_in_list(letters, letter, shift) do
    index = Enum.find_index(letters, &(&1 == letter))
    new_index = Kernel.rem(index + shift, 26)
    Enum.at(letters, new_index)
  end
end
