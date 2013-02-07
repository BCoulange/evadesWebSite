class PhotosController < ApplicationController
before_filter :get_flickr

	def index
    	@photo_sets = flickr.photosets.getList(:user_id => ENV["FLICKR_EVADES_ID"])
	end

	def get_flickr
    	FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    	FlickRaw.shared_secret = ENV["FLICKR_SECRET"]
    	flickr = FlickRaw::Flickr.new
	end

end
