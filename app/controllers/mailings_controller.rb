# encoding: utf-8
class MailingsController < ApplicationController

before_filter :authenticate_user!
  
  # GET /mailings
  # GET /mailings.json
  def index
    @mailings = Mailing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mailings }
    end
  end

  # GET /mailings/1
  # GET /mailings/1.json
  def show
    @mailing = Mailing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mailing }
    end
  end

  # GET /mailings/new
  # GET /mailings/new.json
  def new
    @mailing = Mailing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mailing }
    end
  end

  # GET /mailings/1/edit
  def edit
    @mailing = Mailing.find(params[:id])
  end

  # POST /mailings
  # POST /mailings.json
  def create
    @mailing = Mailing.new(params[:mailing])

    respond_to do |format|
      if @mailing.save
        MailingMailer.welcome_email(@mailing).deliver

        format.html { redirect_to :back, notice: 'Mailing was successfully created.' }
        format.json { render json: @mailing, status: :created, location: @mailing }
      else
        flash[:error] = "Cet email est déjà inscrit" 
        format.html { redirect_to :back }
        format.json { render json: @mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mailings/1
  # PUT /mailings/1.json
  def update
    @mailing = Mailing.find(params[:id])

    respond_to do |format|
      if @mailing.update_attributes(params[:mailing])
        format.html { redirect_to @mailing, notice: 'Mailing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mailing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailings/1
  # DELETE /mailings/1.json
  def destroy
    @mailing = Mailing.find(params[:id])
    @mailing.destroy

    respond_to do |format|
      format.html { redirect_to mailings_url }
      format.json { head :no_content }
    end
  end

def destroyAll
  @mailings = Mailing.all
  @mailings.each do |mailing|
    mailing.destroy
  end
  redirect_to :back
end

def sendNL
  @spectacle=Spectacle.find_by_titre(params[:Spectacle])
  Mailing.all.each do |mailing|
    MailingMailer.newsletter(@spectacle,mailing,request.protocol, request.host_with_port).deliver
  end
  flash[:notice] = "La newsletter est envoyée!" 
  redirect_to :back
end

def importCsv
  emails = MailingImporter.importemails(params[:csv_file].read)
  emails.each do |email|
    unless Mailing.all.include? email then
      @m = Mailing.new(:email => email)
      @m.save
    end
  end
  redirect_to :back

end



end
