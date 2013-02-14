class CavalesController < ApplicationController
require 'will_paginate/array'
  # GET /cavales
  # GET /cavales.json
  def index
    @cavales = Cavale.all.sort_by{|s| s.post_date}
    @no_posted = @cavales
    @no_posted = @no_posted.reject{ |s| (s.post_date-DateTime.now)<0 }
    @cavales = @cavales.reject{ |s| (s.post_date-DateTime.now)>0 }

    @cavales=@cavales.paginate(:page => params[:page],:per_page => 5)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cavales }
    end
  end

  # GET /cavales/1
  # GET /cavales/1.json
  def show
    @cavale = Cavale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cavale }
    end
  end

  # GET /cavales/new
  # GET /cavales/new.json
  def new
    @cavale = Cavale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cavale }
    end
  end

  # GET /cavales/1/edit
  def edit
    @cavale = Cavale.find(params[:id])
  end

  # POST /cavales
  # POST /cavales.json
  def create
    @cavale = Cavale.new(params[:cavale])

    respond_to do |format|
      if @cavale.save
        format.html { redirect_to @cavale, notice: 'Cavale was successfully created.' }
        format.json { render json: @cavale, status: :created, location: @cavale }
      else
        format.html { render action: "new" }
        format.json { render json: @cavale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cavales/1
  # PUT /cavales/1.json
  def update
    @cavale = Cavale.find(params[:id])

    respond_to do |format|
      if @cavale.update_attributes(params[:cavale])
        format.html { redirect_to @cavale, notice: 'Cavale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cavale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cavales/1
  # DELETE /cavales/1.json
  def destroy
    @cavale = Cavale.find(params[:id])
    @cavale.destroy

    respond_to do |format|
      format.html { redirect_to cavales_url }
      format.json { head :no_content }
    end
  end
end
