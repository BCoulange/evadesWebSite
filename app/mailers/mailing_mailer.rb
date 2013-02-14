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

  def notif_contact(contact)
    @contact = contact
    mail(:to => ENV["CONTACT_MAIL"], :subject => "[EDLRB] Contact sur le site!")   
  end


  def newsletter(spectacle,mailing)
    @spectacle = spectacle
    @mailing = mailing
    @lieu = @spectacle.lieu
    @evades = @spectacle.users
    mail(:to => @mailing.email, :subject => "[EDLRB] Nouveau spectacle!")       
  end
end
