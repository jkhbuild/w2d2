require "byebug"
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

  def fill_indices(char, indices)
    indices.each { |i| @guess_word[i] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      print "that has already been attempted"
      return false
    # elsif !(self.already_attempted?(char)) && @secret_word.include?(char)
    #   @attempted_chars << chars
    #   self.fill_indices(char, self.get_matching_indices(char))
    #   @remaining_incorrect_guesses -= 1
    end

    @attempted_chars << char
    self.fill_indices(char, self.get_matching_indices(char))

    @remaining_incorrect_guesses -= 1 if !@secret_word.include?(char)

    true
    
  end

  def ask_user_for_guess
    print "Enter a char"
    self.try_guess(gets.chomp)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "\n" "WIN"
      return true
    end
    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "\n" "LOSE"
      return true
    end
    false
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    end
    false
  end
end


