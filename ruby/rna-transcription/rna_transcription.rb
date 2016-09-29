class Complement
  VERSION = 3

  @@lookup = {
    "C" => "G",
    "G" => "C",
    "T" => "A",
    "A" => "U",
  }

  def self.of_dna(strand)
    strand.chars.map { |nucleotide| complement_of(nucleotide) }.join
  end

  def self.complement_of(nucleotide)
    raise ArgumentError unless @@lookup.key?(nucleotide)

    @@lookup[nucleotide]
  end
end
