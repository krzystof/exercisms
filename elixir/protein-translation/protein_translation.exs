defmodule ProteinTranslation do
  @codon_to_prot %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP",
  }

  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    proteins =
      rna
      |> String.to_charlist()
      |> Enum.take(9)
      |> Enum.chunk(3)
      |> Enum.map(&translate_codons/1)
      |> Enum.take_while(&(&1 != "STOP"))

    if Enum.any?(proteins, &(&1 == "invalid codon")) do
      {:error, "invalid RNA"}
    else
      {:ok, proteins}
    end
  end

  defp translate_codons(chars) do
    chars
    |> List.to_string()
    |> of_codon()
    |> elem(1)
  end

  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case Map.get(@codon_to_prot, codon) do
      nil -> {:error, "invalid codon"}
      protein -> {:ok, protein} 
    end
  end
end

