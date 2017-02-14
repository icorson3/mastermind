require_relative 'game'
require_relative 'messages'

class Mastermind
  include Messages

  def initialize
    player_options
  end

  def player_options
    Messages.welcome
    input = gets.chomp.downcase
    if input == "p" || input == "play"
      Game.new.play_game
    elsif input == "i" || input == "instructions"
      Messages.instructions
      player_options
    elsif input == "q" || input == "quit"
      Messages.quit
      exit
    end
  end
end

if __FILE__ == $0
  Mastermind.new
end
