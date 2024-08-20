class GuessesController < ApplicationController

  def new
    @guess = Guess.new(guess: )
  end

  def create
    @guess = Guess.new(guess_params)
    @game = Game.find(guess_params[:game_id])

    if @guess.save
      redirect_to @game
    else
      render :'games/show', status: :bad_request
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end