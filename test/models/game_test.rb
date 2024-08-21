require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "should not save without game name" do
    game = Game.new(name: "", number: 42)
    assert_not game.save
  end

  test "game name should not be nil" do
    game = Game.new(name: nil, number: 42)
    assert_not game.save
  end

  test "game name should not be too short" do
    game = Game.new(name: "j", number: 42)
    assert_not game.save
  end

  test "game name should not be too long" do
    game = Game.new(name: "OneTwoThreeFourFiveSixSevenEightNineTen", number: 42)
    assert_not game.save
  end

  test "game name should not have non alphabet" do
    game = Game.new(name: "D^ve", number: 42)
    assert_not game.save
  end

  test "game name should have valid name" do
    game = Game.new(name: "Flynn", number: 42)
    assert game.save
  end

  test "game should not save without a number" do
    game = Game.new(name: "Flynn", number: nil)
    assert_not game.save
  end

  test "game number should not be 0" do
    game = Game.new(name: "Flynn", number: 0)
    assert_not game.save
  end

  test "game number should not be below 0" do
    game = Game.new(name: "Flynn", number: -1)
    assert_not game.save
  end

  test "game number should not be above 100" do
    game = Game.new(name: "Flynn", number: 101)
    assert_not game.save
  end

  test "game number should not be a floating point number" do
    game = Game.new(name: "Flynn", number: 0.1)
    assert_not game.save
  end

  test "game number should not be a negative floating point number" do
    game = Game.new(name: "Flynn", number: -0.1)
    assert_not game.save
  end

  test "game number should not be a string" do
    game = Game.new(name: "Flynn", number: "2")
    assert_not game.save
  end

  test "home link returns to index from new game" do
    assert 
  end

  test "create button creates game" do

  end

  test "judge higher request returns a higher number" do

  end
end
