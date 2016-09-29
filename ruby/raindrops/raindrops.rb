require 'prime'

class Raindrops
  def self.convert(number)
    result = Prime.prime_division(number).flatten.map{ |digit| to_drop(digit) }.join

    result == "" ? number.to_s : result
  end

  def self.to_drop(digit)
    if digit % 3 == 0
      "Pling"
    elsif digit % 5 == 0
      "Plang"
    elsif digit % 7 == 0
      "Plong"
    end
  end
end

module BookKeeping
  VERSION = 2
end
