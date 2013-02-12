class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :inscriptionML

  def inscriptionML
  	@mailing=Mailing.new

  end

end
