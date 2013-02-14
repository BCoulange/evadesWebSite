class PagesController < ApplicationController

require 'RMagick'
include Magick

  def home
    @spectacles=Spectacle.all
    @prochain_s=@spectacles.sort_by{|s| s.start_time}.reject{ |s| (s.start_time-DateTime.now)<0 }[0] unless @spectacles.empty?
    @has_affiche=!@prochain_s.nil?
    @news=New
   # @cavales = 
    render :layout => 'homepage'
  end

  def contact
    @new_contact=Contact.new
  end

  def create_contact
    @contact =Contact.new(params[:contact])
    
    if @contact.valid?
      MailingMailer.notif_contact(@contact).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :trial
    end
  end

  def principe
  end

  def galerie
    FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret = ENV["FLICKR_SECRET"]
    flickr = FlickRaw::Flickr.new
    @photo_sets = flickr.photosets.getList(:user_id => ENV["FLICKR_EVADES_ID"])
  end


  def create_candidature
    @candidature =Candidature.new(params[:candidature])
    
    if @candidature.valid?
      MailingMailer.notif_candidate(@candidature).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :trial
    end
  end



  
end
