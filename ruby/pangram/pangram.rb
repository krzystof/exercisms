class Pangram
  def self.is_pangram?(sentence)
    chars_left = 'a'.upto('z').to_a - sentence.downcase.chars
    chars_left.empty?
  end
end

module BookKeeping
  VERSION = 2
end
