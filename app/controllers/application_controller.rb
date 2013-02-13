class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :inscriptionML,:newCandidature

  def inscriptionML
  	@new_mailing=Mailing.new
  end

  def newCandidature
  	@new_candidature=Candidature.new
  end

end
