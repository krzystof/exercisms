defmodule Strain do

  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep([], _), do: []
  def keep([head | tail], fun) do
    if fun.(head) do
      [head] ++ keep(tail, fun)
    else
      keep(tail, fun)
    end
  end

  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) do
    list -- keep(list, fun)
  end
end
