class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game.id)
  end

  def check_guess
    game = Game.find(params[:game_id])
    if params[:guess] == game.current_solution
      flash[:success] = "Great job!"
      redirect_to root_path
    else
      flash[:errors] = "Nope, try again."
      redirect_to game_path(game.id)
    end
  end

  private
  def game_params
    params.require(:game).permit(:current_solution, :clue)
  end

end
