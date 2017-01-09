class Prime
  def self.nth(count)
    raise unless count !== 0
    self.new.find(count)
  end

  def initialize
    @found = []
    @loop = 2
  end

  def find(count)
    while count > @found.size
      if is_prime?(@loop)
        @found.push(@loop)
      end
      @loop = @loop + 1
    end
    @found.last
  end

  def is_prime? number
    if number === 2 || number === 3
      return true
    elsif number % 2 === 0 || number % 3 === 0
      return false
    end

    i = 5
    w = 2
    while i * i <= number
      if number % i === 0
        return false
      end
      i += w
      w = 6 - w
    end
    true
  end
end
