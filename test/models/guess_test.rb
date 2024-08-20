require "test_helper"

class GuessTest < ActiveSupport::TestCase
  test "should not be nil" do
    # game = Game.new(name: "Flynn", number: 42)
    # assert game.save
    guess = Guess.new(game_id: games(:one), guess: nil)
    assert_not guess.save
  end

  test "should not be a string" do
    game = Game.new(name: "Flynn", number: 42)
    assert game.save
    guess = Guess.new(game_id: game.id, guess: "2")
    assert guess.save
  end

  test "should not be a negative floating point number" do
    guess = Guess.new(game_id: games(:one), guess: -0.1)
    assert_not guess.save
  end

  test "should not be a floating point number" do
    guess = Guess.new(game_id: games(:one), guess: 0.1)
    assert_not guess.save
  end

  test "should not be above 100" do
    guess = Guess.new(game_id: games(:one), guess: 101)
    assert_not guess.save
  end

  test "should not be above be a negative number" do
    guess = Guess.new(game_id: games(:one), guess: -1)
    assert_not guess.save
  end

  test "should not be 0" do
    guess = Guess.new(game_id: games(:one).id, guess: 0)
    assert_not guess.save
    # assert guess.errors.length == 1
    assert_equal(1, guess.errors.size)
  end

  test "should have valid guess" do
    guess = Guess.new(game_id: games(:one).id, guess: 42)
    assert guess.save
  end
end
