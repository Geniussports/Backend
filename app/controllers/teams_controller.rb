class TeamsController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create]

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
