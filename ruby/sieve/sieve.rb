class Sieve
  def initialize(limit)
    @range = (2..limit).to_a
    @unmarked_items = []
    @marked_items = []
  end

  def primes
    @range.each do |number|
      next if @marked_items.include? number
      @unmarked_items.push(number)
      @marked_items += find_all_multiples(number)
    end

    @unmarked_items
  end

  def find_all_multiples(number)
    @range.select { |item| item % number == 0 }
  end
end
