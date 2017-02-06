class Phrase
  def initialize(sentence)
    @words = sentence.split(/[^'|\w]/).reject { |w| w.empty? }.map { |w| w.downcase.strip("'") }
  end

  def word_count
    @words.uniq.map { |w| [w, @words.count(w)] }.to_h
  end
end
