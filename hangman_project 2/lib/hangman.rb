class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    random_word = DICTIONARY.sample
    random_word
  end

  attr_accessor :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |ele, i| indices << i if char == ele }
    indices
  end 

  def fill_indices (char, indices)
    indices.each { |i| @guess_word[i] = char }
  end


end
