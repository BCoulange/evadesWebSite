class MailingMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(mailing)
    @mailing = mailing
    @url  = "http://example.com/login"
    mail(:to => mailing.email, :subject => "Welcome to My Awesome Site")
  end  
end
