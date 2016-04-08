class GamesController < ApplicationController
  def index
  end

  def show

  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
  end

  private
  def game_params
    params.require(:game).permit(:current_solution, :clue)
  end

end
