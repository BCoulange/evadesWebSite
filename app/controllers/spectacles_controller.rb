class SpectaclesController < ApplicationController

require 'will_paginate/array'

before_filter :authenticate_user!, :except => [:index, :show]



before_filter :get_users


  # GET /spectacles
  # GET /spectacles.json
  def index
    @spectacles = Spectacle.all.sort_by{|s| s.start_time}
    @prochains_s = @spectacles
    @prochains_s = @prochains_s.reject{ |s| (s.start_time-DateTime.now)<0 }
    @passes_s = @spectacles.reverse
    @passes_s = @passes_s.reject{ |s| (s.start_time-DateTime.now)>0 }
    @passes_s=@passes_s.paginate(:page => params[:page],:per_page => 3)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spectacles }
    end
  end

  # GET /spectacles/1
  # GET /spectacles/1.json
  def show
    @spectacle = Spectacle.find(params[:id])
    @lieu = @spectacle.lieu

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spectacle }
    end
  end

  # GET /spectacles/new
  # GET /spectacles/new.json
  def new
    @spectacle = Spectacle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spectacle }
    end
  end

  # GET /spectacles/1/edit
  def edit
    @spectacle = Spectacle.find(params[:id])
  end

  # POST /spectacles
  # POST /spectacles.json
  def create
    @spectacle = Spectacle.new(params[:spectacle])

    unless  @spectacle.affiche.file? then
      @spectacle.save
      redirect_to showFond_affiche_template_path(AfficheTemplate.all[-1], {:Spectacle => @spectacle.titre, :Ecraser => "1"}) 
    else

      respond_to do |format|
        if @spectacle.save
          format.html { redirect_to @spectacle, notice: 'Spectacle was successfully created.' }
          format.json { render json: @spectacle, status: :created, location: @spectacle }
        else
          format.html { render action: "new" }
          format.json { render json: @spectacle.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /spectacles/1
  # PUT /spectacles/1.json
  def update
    @spectacle = Spectacle.find(params[:id])

    respond_to do |format|
      if @spectacle.update_attributes(params[:spectacle])
        format.html { redirect_to @spectacle, notice: 'Spectacle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spectacle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spectacles/1
  # DELETE /spectacles/1.json
  def destroy
    @spectacle = Spectacle.find(params[:id])
    @spectacle.destroy

    respond_to do |format|
      format.html { redirect_to spectacles_url }
      format.json { head :no_content }
    end
  end

  def get_users
    @users = User.find(:all, :order => "surnom")
  end



end
