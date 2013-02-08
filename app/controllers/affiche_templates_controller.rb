class AfficheTemplatesController < ApplicationController
  # GET /affiche_templates
  # GET /affiche_templates.json

before_filter :authenticate_user!

  def index
    @affiche_templates = AfficheTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiche_templates }
    end
  end

  # GET /affiche_templates/1
  # GET /affiche_templates/1.json
  def show
    @affiche_template = AfficheTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiche_template }
    end
  end

  # GET /affiche_templates/new
  # GET /affiche_templates/new.json
  def new
    @affiche_template = AfficheTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiche_template }
    end
  end

  # GET /affiche_templates/1/edit
  def edit
    @affiche_template = AfficheTemplate.find(params[:id])
  end

  # POST /affiche_templates
  # POST /affiche_templates.json
  def create
    @affiche_template = AfficheTemplate.new(params[:affiche_template])

    respond_to do |format|
      if @affiche_template.save
        format.html { redirect_to @affiche_template, notice: 'Affiche template was successfully created.' }
        format.json { render json: @affiche_template, status: :created, location: @affiche_template }
      else
        format.html { render action: "new" }
        format.json { render json: @affiche_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiche_templates/1
  # PUT /affiche_templates/1.json
  def update
    @affiche_template = AfficheTemplate.find(params[:id])

    respond_to do |format|
      if @affiche_template.update_attributes(params[:affiche_template])
        format.html { redirect_to @affiche_template, notice: 'Affiche template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiche_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiche_templates/1
  # DELETE /affiche_templates/1.json
  def destroy
    @affiche_template = AfficheTemplate.find(params[:id])
    @affiche_template.destroy

    respond_to do |format|
      format.html { redirect_to affiche_templates_url }
      format.json { head :no_content }
    end
  end
end
