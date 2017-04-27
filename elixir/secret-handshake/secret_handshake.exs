use Bitwise

defmodule SecretHandshake do
  @doc """
      1 = wink
     10 = double blink
    100 = close your eyes
   1000 = jump
  10000 = Reverse the order of the operations in the secret handshake
  """
  @words %{1 => "wink", 2 => "double blink", 4 => "close your eyes", 8 => "jump"}

  @reverse 16

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    @words
    |> Enum.map(fn({k, _}) -> word_for(k &&& code) end)
    |> Enum.reject(&(is_nil(&1)))
    |> reverse(code)
  end

  def word_for(idx) do
    @words[idx]
  end

  def reverse(list, code) do
    if (code &&& @reverse) != 0 do
      Enum.reverse list
    else
      list
    end
  end
end


