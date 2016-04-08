class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    if Player.all.count == 0
      Player.create(name: params[:name], role: "host", score: 0)
    else
      Player.create(name: params[:name], role: "player", score: 0)
    end
    redirect_to g
  end
end
