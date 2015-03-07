class TeamsController < ApplicationController
  before_action :authenticate_user_from_token! , :only => [:create]

  def new
  @team = Team.new
  render :new
  end

  def create

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
