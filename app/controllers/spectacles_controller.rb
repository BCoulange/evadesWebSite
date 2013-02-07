class SpectaclesController < ApplicationController

before_filter :get_users

  # GET /spectacles
  # GET /spectacles.json
  def index
    @spectacles = Spectacle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spectacles }
    end
  end

  # GET /spectacles/1
  # GET /spectacles/1.json
  def show
    @spectacle = Spectacle.find(params[:id])

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
