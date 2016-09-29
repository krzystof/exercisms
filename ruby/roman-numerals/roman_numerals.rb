class Fixnum
  def to_roman
    romans_conversions = {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV"
    }

    romans_conversions.inject("I" * self) do |string, num_to_roman|
      string.gsub("I" * num_to_roman.first, num_to_roman.last)
    end
  end
end

module BookKeeping
  VERSION = 2
end
