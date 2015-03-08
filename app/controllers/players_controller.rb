class PlayersController < ApplicationController
  before_action :authenticate_user_from_token!

  def show
    @player = Player.find(params[:id])
    render_player
  end

  def update
    @player = Player.find(params[:id])
    if @player.families.any? { |f| f.user_id == current_user.id }
      @player.update(player_params)
      current_user.relationship(@player, params[:relationship]) if params[:relationship]
      render_player
    else
      render json: {messages: "Sorry, only a family member can edit a player's information."},
                    status: :unauthorized
    end
  end

  private
    def player_params
      params.require(:player).permit(:name, :medical_name, :medical_number, :medical_info)
    end

    def render_player
      family = @player.families.reload.map do |f|
        user = User.find(f.user_id)
        { user: {id: user.id, email: user.email}, relationship: f.relationship }
      end
      render json: {player: @player, family: family }, status: :ok
    end
end
