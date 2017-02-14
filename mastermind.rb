
class Mastermind

  def initialize
    player_options
  end

  def player_options
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    input = gets.chomp.downcase
    if input == "p" || input == "play"
      key = %w{r r r r g g g g b b b b y y y y}.sample(4)
      play_game(key)
    elsif input == "i" || input == "instructions"
      puts "these are the instructions"
      player_options
    elsif input == "q" || input == "quit"
      puts "Thanks for playing!"
      exit
    end
  end


def play_game(key)
  puts "I have generated a beginner sequence with four elements made up of: (r)ed,
  (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess? You can get the secret code by typing (c)heat."
  guess = gets.chomp.downcase.chars
  if guess.join == "c" || guess.join == "cheat"
    puts "You cheater! The secret code is #{key.join}"
    play_game(key)
  elsif guess.join == "q" || guess.join == "quit"
    puts "Thanks for playing!"
    exit
  elsif guess.length > 4
    puts "Your guess is too long. Try again"
    play_game(key)
  elsif guess.length < 4
    puts "Your guess is too short. Try again"
    play_game(key)
  else
    check_letters_for_code_match(guess, key)
  end
end

  def check_letters_for_code_match(guess, key)
    if guess == key
      puts "You got the write answer!"
      exit
    end
    positions = guess.zip(key).count do |g|
                g[0] == g[1]
              end
    elements = guess.uniq.count do |g|
                  key.include?(g)
                end
    puts "You got #{elements} correct elements in #{positions} correct positions"
    play_game(key)
  end
end



if __FILE__ == $0
  Mastermind.new
end
