class PlayersController < ApplicationController
  before_action :authenticate_user_from_token!

  def show
    @player = Player.find(params[:id])
    render json: @player
  end

  def update
    @player = Player.find(params[:id])
    if @player.families.any? { |par| par.id == current_user.id }
      render json: "Yes, you are a parent."
    else
      render json: "You're not this kids parent, GTFO"
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

end