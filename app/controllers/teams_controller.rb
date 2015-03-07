class TeamsController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create, :update]

  def create
  @team = Team.new(team_params)
    if @team.save
      Role.create(user_id: current_user.id, team_id: @team.id, manager: true)
      render json: { team: @team }, status: :created
    else
      render json: { messages: @team.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @team = Team.find(params[:id])
    invites = JSON.parse(params[:invites])
    if invites
      invites.each do |invite|
        email = invite[0]
        user = User.find_by(email: email)
        if user
          player = user.players.where("lower(name) = ?", invite[1].downcase).first
        else
          temp_pass = SecureRandom.hex(8)
          user = User.create(email: email, temp_password: true, password: temp_pass)
        end
        unless player
          player = Player.create(name: invite[1])
          user.players << player
        end
        @team.players << player
        @team.users << user
        temp_pass ||= nil
        GeniusSportsMailer.invitation(invite, @team.name, temp_pass).deliver_now
      end
      render json: "Invites sent"
    else
      render json: "This isn't working yet."
    # if @team.save
    #   render json: { team: @team }, status: :created
    # else
    #   render json: { messages: @team.errors.full_messages },
    #          status: :unprocessable_entity
    end
  end

  def show
    @team = Team.find(params[:id])
    render json: {team: @team,
                  coaches: @team.json_coaches,
                  players: @team.json_players}
  end

private
  def set_team
    @team = Team.find(params[:id])
  end

  def set_user
    @user = User.find(paramas[:id])
  end

  def team_params
    params.require(:team).permit(:name)
  end

end
