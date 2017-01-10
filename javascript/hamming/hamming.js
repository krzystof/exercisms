var Hamming = function Hamming() {}

Hamming.prototype = {
    compute: (strandA, strandB) => {
        if (strandA.length !== strandB.length) {
            throw new Error('DNA strands must be of equal length.')
        }

        return strandA.split('').filter((letter, pos) => letter !== strandB[pos]).length
    }
}

module.exports = Hamming
