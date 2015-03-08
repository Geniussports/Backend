class UsersController < ApplicationController
  before_action :authenticate_user_from_token!

  def show
    render json: { user: current_user, teams: current_user.teams }, status: :ok
  end
end