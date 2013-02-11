# encoding: utf-8
class AfficheTemplatesController < ApplicationController
  # GET /affiche_templates
  # GET /affiche_templates.json

before_filter :authenticate_user!
before_filter :findATemplate, :except => [:index, :new, :create]

require 'RMagick'                                       # Pour faire des choses sur les images (ImageMagick)
include Magick

  def findATemplate
    @affiche_template = AfficheTemplate.find(params[:id])
  end

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
    @affiche_template.destroy

    respond_to do |format|
      format.html { redirect_to affiche_templates_url }
      format.json { head :no_content }
    end
  end


def showFond

  @spectacle=Spectacle.find_by_titre(params[:Spectacle])
  @lieu=@spectacle.lieu
  lieuMessage="#{@lieu.nom}\n#{@lieu.street}\n#{@lieu.city}"
  frenchWeekdays = ["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"]
  frenchMonths = ["Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre"]
  @dh=[frenchWeekdays[@spectacle.start_time.wday.to_i],@spectacle.start_time.mday.to_s,frenchMonths[@spectacle.start_time.mon]].join(" ")
  @dh+=" à #{@spectacle.start_time.hour}h#{@spectacle.start_time.min}"

  img = ImageList.new("Public"+@affiche_template.fond.url.split("?")[0])
  # Ajout de la date et de l'heure
  txt = Draw.new
  img.annotate(txt,@affiche_template.dhwidth,@affiche_template.dhheigh,@affiche_template.dhx,@affiche_template.dhy, @dh){
    txt.gravity = CenterGravity
    txt.pointsize = 400
    txt.stroke = '#000000'
    txt.fill = '#ffffff'
    txt.font_weight = Magick::BoldWeight
  }

  # Ajout du teaser
  txt2 = Draw.new
  img.annotate(txt2,@affiche_template.teaserwidth,@affiche_template.teaserheigh,@affiche_template.teaserx,@affiche_template.teasery, params[:teaser]){
      txt2.gravity = CenterGravity
      txt2.pointsize = 150
      txt2.stroke = '#000000'
      txt2.fill = '#ffffff'
      txt2.font_weight = Magick::BoldWeight
  }

    img.format = 'jpeg'
    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'
#  redirect_to :back
end

  def lolcat
    img = ImageList.new('public/computer-cat.jpg')
    txt = Draw.new
    img.annotate(txt, 0,0,0,0, "In ur Railz, annotatin ur picz."){
    txt.gravity = Magick::SouthGravity
    txt.pointsize = 25
    txt.stroke = '#000000'
    txt.fill = '#ffffff'
    txt.font_weight = Magick::BoldWeight
    }
    img.format = 'jpeg'
    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'
  end


def genAffiche(fond,teaser,teaser_texte,dateheure,dateheure_texte,infosLieu,infoLieu_texte,affiche)
  img = ImageList.new(fond)
  txt = Draw.new
  txt2 = Draw.new
  txt3 = Draw.new

  yoffset = teaser[:yoffset]
  wrap_intelligent(teaser_texte, teaser[:lar]).split('\n').each do |row|
    img.annotate(txt, teaser[:width],teaser[:heigh],teaser[:xoffset],teaser[:yoffset], row){
      txt.gravity = CenterGravity
      txt.pointsize = 150
      txt.stroke = '#000000'
      txt.fill = '#ffffff'
      txt.font_weight = Magick::BoldWeight
    }
    yoffset+=20
  end

  img.annotate(txt2, dateheure[:width],dateheure[:heigh],dateheure[:xoffset],dateheure[:yoffset], dateheure_texte){
    txt2.gravity = CenterGravity
    txt2.pointsize = 400
    txt2.stroke = '#000000'
    txt2.fill = '#ffffff'
    txt2.font_weight = Magick::BoldWeight
  }

  img.annotate(txt3, infosLieu[:width],infosLieu[:heigh],infosLieu[:xoffset],infosLieu[:yoffset], infoLieu_texte){
    txt3.pointsize = 120
    txt3.stroke = '#000000'
    txt3.fill = '#ffffff'
    txt3.font_weight = Magick::BoldWeight
  }

  img.format = 'jpeg'
  img.write(affiche)
  img.destroy!

end





private
# remplacer le wrap par @comment_text.cool_string_function( 56 )








end
