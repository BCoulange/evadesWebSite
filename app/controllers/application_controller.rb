class ApplicationController < ActionController::Base
  protect_from_forgery

  @spectacles=Spectacle.all
end
