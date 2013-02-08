class PagesController < ApplicationController

require 'RMagick'
include Magick

  def home
    @spectacles=Spectacle.all
    @prochain_s=@spectacles.sort_by{|s| s.start_time}.reject{ |s| (s.start_time-DateTime.now)<0 }[0] unless @spectacles.empty?


    render :layout => 'homepage'
  end

  def contact
  end


  def principe
  end

  def galerie
    FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret = ENV["FLICKR_SECRET"]
    flickr = FlickRaw::Flickr.new
    @photo_sets = flickr.photosets.getList(:user_id => ENV["FLICKR_EVADES_ID"])
  end




  
end
