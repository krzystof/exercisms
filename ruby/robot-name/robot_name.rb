class Robot
  attr_reader :name
  @@names = []

  def initialize
    @name = generate_name
  end

  def reset
    @@names.delete(@name)
    @name = generate_name
  end

  private
    def generate_name
      new_name = (two_random_letters + three_random_numbers).join

      if @@names.include? new_name
        return generate_name
      end

      @@names.push(new_name)
      new_name
    end

    def two_random_letters
      2.times.map do |variable|
        chars = ("A".."Z").to_a
        chars[rand(chars.size)]
      end
    end

    def three_random_numbers
      3.times.map { rand(0...9) }
    end
end

module BookKeeping
  VERSION = 2
end
