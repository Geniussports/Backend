class GeniusSportsMailer < ActionMailer::Base
  default from: 'noreply@geniussports.com'

  def email_name
    mail(to: 'matthewsa1320@gmail.com', subject: 'Test email')
  end

  def invitation(invite, team_name, temp_pass)
    @invite = invite
    @temp_pass = temp_pass
    mail(to: @invite[0], subject: "Team Invite: #{team_name}")
  end
end
