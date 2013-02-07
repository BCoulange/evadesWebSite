class PagesController < ApplicationController
  def home
    @spectacles=Spectacle.all
    @prochain_s=@spectacles.sort_by{|s| s.start_time}.reject! { |s| s.start_time-DateTime.now<0 }[0]
    render :layout => 'homepage'
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
