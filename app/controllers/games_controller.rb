class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new(name: "")
  end

  def create
    @game = Game.new(game_params)
    @game.number = rand(1..100)

    if @game.save
      redirect_to @game
    else
      render :new, status: :bad_request
    end
  end

  def show
    @game = Game.find(params[:id])
    @guess = Guess.new

    @game.logic(flash)
  end

  def update

  end


  private

  def game_params
    params.require(:game).permit(:name, :number)
  end
end