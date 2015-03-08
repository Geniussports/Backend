class PlayersController < ApplicationController
  before_action :authenticate_user_from_token!

  def show
    @player = Player.find(params[:id])
    render_player
  end

  def update
    @player = Player.find(params[:id])
    if @player.families.any? { |par| par.id == current_user.id }
      @player.update(player_params)
      render_player
    else
      render json: "Sorry, only a family member can edit a player's information."
    end
  end

  def create
    team = Team.find(params[:team])
    parent = User.find_by(email: params[:email])
    name = params[:name]
    if parent
      @player = parent.players.where("lower(name) = ?", name.downcase).first
      if @player
        # TODO STUFF??
      else
        @player = Player.create(name: name)
        @player.teams << team
        @player.users << parent
        # TODO STUFF??
        binding.pry
        render json: "Sure, we sent an invitation, wink, wink"
      end
    else
      render json: "Sure, we sent an invitation, wink, wink"
    end
  end

  private
    def player_params
      params.require(:player).permit(:name, :medical_name, :medical_number, :medical_info)
    end

    def render_player
      family = @player.families.map do |f|
        user = User.find(f.user_id)
        { user: {id: user.id, email: user.email}, relationship: f.relationship }
      end
      render json: {player: @player, family: family }, status: :ok
    end
end
