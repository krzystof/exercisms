class Grains
  BOARD = (1..64)

  def self.square(position)
    raise ArgumentError unless BOARD.include? position
    1.upto(position).inject{ |grains, n| 2 * grains }
  end

  def self.total
    BOARD.inject{ |sum, n| sum + square(n)}
  end
end

module BookKeeping
  VERSION = 1
end
