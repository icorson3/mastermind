module Messages
  def self.welcome
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.instructions
    puts "these are the instructions"
  end

  def self.quit
    puts "Thanks for playing!"
  end

  def self.game_play
    puts "I have generated a beginner sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\nWhat's your guess? You can get the secret code by typing (c)heat."
  end

  def self.cheat(key)
    puts "You cheater! The secret code is #{key.join}"
  end

  def self.too_long
    puts "Your guess is too long. Try again"
  end

  def self.too_short
    puts "Your guess is too short. Try again"
  end

  def self.win
    puts "You got the write answer!"
  end

  def self.feedback(positions, elements)
    puts "You got #{elements} correct elements in #{positions} correct positions"
  end

end
