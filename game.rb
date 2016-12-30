require_relative 'messages'

class Game
  include Messages
  attr_reader :key

  def initialize
    @key = generate_random_key
  end

  def generate_random_key
    %w{r r r r g g g g b b b b y y y y}.sample(4)
  end

  def play_game
    Messages.game_play
    guess = gets.chomp.downcase.chars
    if  guess.join == "c" || guess.join == "cheat"
      Messages.cheat(key)
      play_game
    elsif guess.length > 4
      Messages.too_long
      play_game
    elsif guess.length < 4
      Messages.too_short
      play_game
    else
      check_letters_for_code_match(guess)
    end
  end

  def check_letters_for_code_match(guess)
    if guess == key
      Messages.win
      exit
    end
    Messages.feedback(num_correct_positions(guess), num_correct_elements(guess))
    play_game
  end

  def num_correct_positions(guess)
    guess.zip(key).count { |g| g[0] == g[1] }
  end

  def num_correct_elements(guess)
    guess.uniq.count{ |g| key.include?(g) }
  end
end
