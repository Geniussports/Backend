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
    if @team.roles.where(manager:true).any? {|m| m.user_id == current_user.id}
      invites = JSON.parse(params[:invites]) if params[:invites]
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
        render json: "Invites sent", status: :ok
      else
        player = Player.find(params[:player_id])
        if player && player.teams.any? {|t| t.id == @team.id}
          player.teams.delete(@team)
          player.users.each do |user|
            user.teams.delete(@team)
          end
          render json: {message: "Success"}, status: :ok
        else
          render json: {messages: "wat" },
                  status: :unprocessable_entity
        end
      end
    else
      render json: {message: "Unauthorized User"},
             status: :unauthorized
    end
  end

  def show
    @team = Team.find(params[:id])
    render json: {team: @team,
                  coaches: @team.json_coaches,
                  players: @team.json_players,
                  games: @team.json_games}
  end

private
  
  def team_params
    params.require(:team).permit(:name, :sport)
  end

end
