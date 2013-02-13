class PhotosController < ApplicationController

require 'will_paginate/array'

before_filter :get_flickr

	def index
    	@photo_sets = flickr.photosets.getList(:user_id => ENV["FLICKR_EVADES_ID"])
	end

	def show
		@set=flickr.photosets.getInfo(:photoset_id => params[:id])
		@photos=flickr.photosets.getPhotos(:photoset_id => @set.id).photo
		    	@photos=@photos.paginate(:page => params[:page],:per_page => 10)

	end

	def get_flickr
    	FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    	FlickRaw.shared_secret = ENV["FLICKR_SECRET"]
    	flickr = FlickRaw::Flickr.new
	end

end
