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

def constructLines(texte,txt,width,img)

width_tot = txt.get_type_metrics(img,texte)[3]
lettersize = width_tot / texte.size

  # construct lines
words=texte.split(" ")
lines=[]
localLine=""
words.each do |w|
  if((localLine+w).size * lettersize) < width then
    localLine+=" "+w
  else
    lines << localLine
    localLine=w
  end
end
lines << localLine

return lines

end


def getPointSizeBySurface(texte,img,sizePortionX,sizePortionY) 

# get one character size
txt = Draw.new
txt.pointsize = 10
size = txt.get_type_metrics(img,texte)
width,height = size[3],size[4]

# aire de la cellule dans laquelle on veut mettre le texte
aire = img.columns.to_f * img.rows.to_f * sizePortionX.to_f * sizePortionY.to_f
ratioTxt = height.to_f / width.to_f 

# calcul de la taille en point
new_Width  = Math.sqrt( aire / ratioTxt ).to_i
lettersize = new_Width / texte.size
pointsize = (new_Width / width * 10).to_i


return pointsize

end


def getPointSize(texte,img,sizePortion)

# get one character size
txt = Draw.new
txt.pointsize = 10
size = txt.get_type_metrics(img,texte)
width,height = size[3],size[4]

# nb de pixels a avoir par lettre
nbPixByLetter = img.columns.to_f * sizePortion

return (nbPixByLetter / width * 10).to_i

end


def showFond
  

  @spectacle=Spectacle.find_by_titre(params[:Spectacle])
  @lieu=Lieu.find(@spectacle.lieu_id)
  lieuMessage="#{@lieu.nom}\n#{@lieu.street}\n#{@lieu.city}"
  frenchWeekdays = ["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"]
  frenchMonths = ["Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre"]
  @dh=[frenchWeekdays[@spectacle.start_time.wday.to_i],@spectacle.start_time.mday.to_s,frenchMonths[@spectacle.start_time.mon]].join(" ")
  @dh+=" à #{@spectacle.start_time.hour}h#{sprintf('%02d',@spectacle.start_time.min)}"


  img = ImageList.new("Public"+@affiche_template.fond.url.split("?")[0])
  @dh_size=getPointSize(@dh,img,@affiche_template.dhwidth.to_f / img.columns.to_f)

  # Ajout de la date et de l'heure
  txt = Draw.new
  txt.pointsize = @dh_size
  img.annotate(txt,@affiche_template.dhwidth,@affiche_template.dhheigh,@affiche_template.dhx,@affiche_template.dhy, @dh){
    txt.gravity = CenterGravity
    txt.stroke = '#000000'
    txt.fill = '#ffffff'
    txt.font_weight = Magick::BoldWeight
  }

  # Ajout du teaser
  unless params[:teaser].nil? then

  @pointsize=getPointSizeBySurface(params[:teaser],img,@affiche_template.teaserwidth.to_f / img.columns.to_f,@affiche_template.teaserheigh.to_f / img.rows.to_f) 

  txt2 = Draw.new
  txt2.pointsize = @pointsize
  txt2.pointsize = @dh_size * 0.7 if @pointsize>@dh_size * 0.5 
  @lines = constructLines(params[:teaser],txt2,@affiche_template.teaserwidth,img)
  tx_height=txt2.get_type_metrics(img,params[:teaser])[4]
  tx_height+=tx_height*0.2

  decay=@affiche_template.teasery
  @lines.each do |l|
    img.annotate(txt2,@affiche_template.teaserwidth,@affiche_template.teaserheigh,@affiche_template.teaserx,decay, l){
        txt2.gravity = NorthGravity
        txt2.stroke = '#000000'
        txt2.fill = '#ffffff'
        txt2.font_weight = Magick::BoldWeight
    }
    decay+=tx_height
  end

end

  if(params[:Ecraser]) then

#    img.format = 'jpeg'

    file = Tempfile.new('my_picture')
    img.flatten_images.write(file.path)
    @spectacle.affiche = file
    @spectacle.save

#    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'

# File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_george.jpg'))


    redirect_to @spectacle

  else

    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'

  end

end






private
# remplacer le wrap par @comment_text.cool_string_function( 56 )








end
