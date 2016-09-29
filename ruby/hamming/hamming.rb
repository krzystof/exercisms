class Hamming
    VERSION=1

    def self.compute(strandA, strandB)
        raise ArgumentError, 'Strand have different lengths' if strandA.length != strandB.length

        # With the help of other solutions...
        strandA.chars.zip(strandB.chars).count {|a, b| a != b}

        # strandA.chars.map
        #        .with_index {|char, index| char != strandB.chars.at(index)}
        #        .count {|x| x == true}
    end
end
