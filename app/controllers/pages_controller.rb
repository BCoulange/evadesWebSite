class PagesController < ApplicationController
  def home
    @spectacles=Spectacle.all
    render :layout => 'homepage'
  end

  def index
    redirect_to :home
  end


  def contact
  end

  def qui
  end

  def principe
  end

  def galerie
  end
end
