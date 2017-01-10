class Year
  def self.leap?(year)
    if year % 100 == 0 && year % 400 != 0
      false
    else
      year % 4 == 0
    end
  end
end

module BookKeeping
  VERSION = 2
end
