defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if not Enum.member?(@nucleotides, nucleotide) || not only_nucleotides(strand) do
      raise ArgumentError
    end
    Enum.count strand, &(&1 == nucleotide)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    if not only_nucleotides(strand) do
      raise ArgumentError
    end
    Enum.map(@nucleotides, fn(n) -> %{n => count(strand, n)} end) |> List.foldl(%{}, &Map.merge/2)
  end

  defp only_nucleotides(strand) do
    strand |> Enum.all?(&(Enum.member?(@nucleotides, &1)))
  end
end
