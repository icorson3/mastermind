require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

class GameTest < Minitest::Test
  def test_something
    g = Game.new
    require "pry"; binding.pry
    g.instance_variable_set(:@key, ["r", "g", "g", "b"])
    guess = ["g", "g", "y", "r"]
    assert_equal 1, g.num_correct_positions(guess)
    assert_equal 2, g.num_correct_elements(guess)
  end
end
