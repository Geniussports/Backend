class GamesController < ApplicationController
  before_action :authenticate_user_from_token!, :only => [:create]
  before_action :set_game, :only => [:show]

  def create
    @game = Game.new(game_params)
    if @game.save
      render json: { game: @game }, status: :created
    else
      render json: { error: "Game not created" }, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    render json: { game: @game }
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render json: { game: "Game was deleted" }, status: :ok
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:location)
  end
end