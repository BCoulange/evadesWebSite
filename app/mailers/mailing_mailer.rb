class MailingMailer < ActionMailer::Base
  default from: ENV["GMAIL_MAIL"]

  def welcome_email(mailing)
    @mailing = mailing
    @url  = "http://example.com/login"
    mail(:to => mailing.email, :subject => "Welcome to My Awesome Site")
  end  

  def notif_candidate(candidature)
  	@candidature = candidature
    mail(:to => ENV["CONTACT_MAIL"], :subject => "[EDLRB] Nouvelle candidature!") 	
  end
end
