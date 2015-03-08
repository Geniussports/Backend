class GamesController < ApplicationController
  before_action :authenticate_user_from_token!, :only => [:create, :edit, :destroy]
  
  def create
    @game = Game.new(game_params)
    @team = Team.find(params[:game][:team_id]) if params[:game][:team_id]
    if @team && @game.save 
      @team.games << @game
      render json: { game: @game }, status: :created
    else
      render json: { error: "Game not created" }, status: :unprocessable_entity
    end
  end

  def show
    @game = Game.find(params[:id])
    render json: { game: @game }, status: :ok
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    if @game.save!
      render json: { game: @game }, status: :ok
    else
      render json: { error: "Game was not updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render json: { game: "Game was deleted" }, status: :ok
  end

  private
  
  def game_params
    params.require(:game).permit(:location, :date, :time, :opponent, :team_id)
  end
end