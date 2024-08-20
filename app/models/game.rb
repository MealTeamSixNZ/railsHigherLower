class Game < ApplicationRecord
  has_many :guesses
  before_save :titleize_name

  validates   :name, length: {minimum: 2, maximum: 24}, format: {with: /\A[a-z A-Z]+\z/}, presence: true
  validates   :number, numericality: { only_numeric: true, only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100}, presence: true

  def logic(flash)
    latest_guess = guesses.last
    if latest_guess != nil
      case
      when latest_guess.guess < number
        flash[:notice] = "Higher!"
      when latest_guess.guess > number
        flash[:notice] = "Lower!"
      else
        flash[:notice] = "You won!"
      end
    else
      flash[:notice] = "Enter a number"
    end
  end

  private

  def titleize_name
    self.name = name.titleize
  end
end
