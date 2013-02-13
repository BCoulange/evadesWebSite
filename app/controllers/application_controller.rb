class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :inscriptionML

  def inscriptionML
  	@new_mailing=Mailing.new

  end

end
