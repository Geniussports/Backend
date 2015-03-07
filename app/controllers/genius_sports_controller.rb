class GeniusSportsController < ApplicationController

  def index
    GeniusSportsMailer.email_name.deliver_now
    redirect_to new_user_registration_path
  end


end