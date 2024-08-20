class Guess < ApplicationRecord
  belongs_to :game

  validates   :guess, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}, presence: true
  validates   :game_id, presence: true
end
