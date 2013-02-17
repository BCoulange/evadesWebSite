class ReunionCasController < ApplicationController

before_filter :authenticate_user!

  # GET /reunion_cas
  # GET /reunion_cas.json
  def index
    @reunion_cas = ReunionCa.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reunion_cas }
    end
  end

  # GET /reunion_cas/1
  # GET /reunion_cas/1.json
  def show
    @reunion_ca = ReunionCa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reunion_ca }
    end
  end

  # GET /reunion_cas/new
  # GET /reunion_cas/new.json
  def new
    @reunion_ca = ReunionCa.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reunion_ca }
    end
  end

  # GET /reunion_cas/1/edit
  def edit
    @reunion_ca = ReunionCa.find(params[:id])
  end

  # POST /reunion_cas
  # POST /reunion_cas.json
  def create
    @reunion_ca = ReunionCa.new(params[:reunion_ca])

    respond_to do |format|
      if @reunion_ca.save
        format.html { redirect_to @reunion_ca, notice: 'Reunion ca was successfully created.' }
        format.json { render json: @reunion_ca, status: :created, location: @reunion_ca }
      else
        format.html { render action: "new" }
        format.json { render json: @reunion_ca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reunion_cas/1
  # PUT /reunion_cas/1.json
  def update
    @reunion_ca = ReunionCa.find(params[:id])

    respond_to do |format|
      if @reunion_ca.update_attributes(params[:reunion_ca])
        format.html { redirect_to @reunion_ca, notice: 'Reunion ca was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reunion_ca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reunion_cas/1
  # DELETE /reunion_cas/1.json
  def destroy
    @reunion_ca = ReunionCa.find(params[:id])
    @reunion_ca.destroy

    respond_to do |format|
      format.html { redirect_to reunion_cas_url }
      format.json { head :no_content }
    end
  end
end
