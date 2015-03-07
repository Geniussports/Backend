class GeniusSportsMailer < ActionMailer::Base
  default from: 'noreply@geniussports.com'
  
  def email_name
    mail(to: 'matthewsa1320@gmail.com', subject: 'Test email')
  end

end