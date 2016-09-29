<?php

//
// This is only a SKELETON file for the "Hamming" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

function distance($strandA, $strandB)
{
    if (strlen($strandA) !== strlen($strandB)) {
        throw new InvalidArgumentException('DNA strands must be of equal length.');
    }

    return array_reduce(
        range(0, strlen($strandA) - 1),
        function ($distance, $index) use ($strandA, $strandB) {
            return $distance += substr($strandA, $index, 1) === substr($strandB, $index, 1)
                              ? 0 : 1;
        }
    );
}
