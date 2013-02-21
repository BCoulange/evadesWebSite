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

def genATWithBloc
#  attr_accessible  :lieuheigh, :lieuwidth, :lieux, :lieuy, :teaserheigh, :teaserwidth, :teaserx, :teasery

  @affiche_template = AfficheTemplate.find(params[:id])

  # ouverture de l'original pour calculer sa taille
  orig = ImageList.new(@affiche_template.fond.url.split("?")[0])  
  @or_x,@or_y = orig.columns,orig.rows
  orig.destroy!

  # ouverture de l'image a modifier
  img = ImageList.new(@affiche_template.fond.url(:homePage).split("?")[0])

  # calcul des coeffs ajustés
  @dhx_i = ( @affiche_template.dhx.to_f / @or_x * img.columns ).to_i
  @dhx_o = ( ( @affiche_template.dhx.to_f + @affiche_template.dhwidth )/ @or_x * img.columns ).to_i
  @dhy_i = ( @affiche_template.dhy.to_f / @or_y * img.rows ).to_i
  @dhy_o = ( ( @affiche_template.dhy.to_f + @affiche_template.dhheigh )/ @or_y * img.rows ).to_i
  @dh_size=getPointSize("Date et Heure",img,0.9*@affiche_template.dhwidth.to_f / @or_x)

  # Ajout du descriptif
  txt = Draw.new
  txt.pointsize = @dh_size
  img.annotate(txt,@dhx_o-@dhx_i,@dhy_o-@dhy_i,@dhx_i,@dhy_i, "Date et Heure"){
    txt.gravity = CenterGravity
    txt.stroke = 'red'
    txt.fill = 'transparent'
    txt.font_weight = Magick::BoldWeight
  }

  @lieux_i = ( @affiche_template.lieux.to_f / @or_x * img.columns ).to_i
  @lieux_o = ( ( @affiche_template.lieux.to_f + @affiche_template.lieuwidth )/ @or_x * img.columns ).to_i
  @lieuy_i = ( @affiche_template.lieuy.to_f / @or_y * img.rows ).to_i
  @lieuy_o = ( ( @affiche_template.lieuy.to_f + @affiche_template.lieuheigh )/ @or_y * img.rows ).to_i
  @lieu_size=getPointSize("Lieu",img,0.9*@affiche_template.lieuwidth.to_f / @or_x)

  # Ajout du descriptif
  txt2 = Draw.new
  txt2.pointsize = @lieu_size
  img.annotate(txt2,@lieux_o-@lieux_i,@lieuy_o-@lieuy_i,@lieux_i,@lieuy_i, "Lieu"){
    txt2.gravity = CenterGravity
    txt2.stroke = 'red'
    txt2.fill = 'transparent'
    txt2.font_weight = Magick::BoldWeight
  }

  @teaserx_i = ( @affiche_template.teaserx.to_f / @or_x * img.columns ).to_i
  @teaserx_o = ( ( @affiche_template.teaserx.to_f + @affiche_template.teaserwidth )/ @or_x * img.columns ).to_i
  @teasery_i = ( @affiche_template.teasery.to_f / @or_y * img.rows ).to_i
  @teasery_o = ( ( @affiche_template.teasery.to_f + @affiche_template.teaserheigh )/ @or_y * img.rows ).to_i
  @teaser_size=getPointSize("Teaser",img,0.9*@affiche_template.teaserwidth.to_f / @or_x)

  # Ajout du descriptif
  txt3 = Draw.new
  txt3.pointsize = @teaser_size
  img.annotate(txt3,@teaserx_o-@teaserx_i,@teasery_o-@teasery_i,@teaserx_i,@teasery_i, "Teaser"){
    txt3.gravity = CenterGravity
    txt3.stroke = 'red'
    txt3.fill = 'transparent'
    txt3.font_weight = Magick::BoldWeight
  }

  rect = Draw.new
  rect.stroke('red').stroke_width(1)
  rect.fill('transparent')
  rect.rectangle(@dhx_i,@dhy_i,@dhx_o,@dhy_o)
  rect.rectangle(@lieux_i,@lieuy_i,@lieux_o,@lieuy_o)
  rect.rectangle(@teaserx_i,@teasery_i,@teaserx_o,@teasery_o)
  rect.draw(img)

  file = Tempfile.new('my_picture')
  img.flatten_images.write(file.path)
  @affiche_template.fond_with_blocs = file
  @affiche_template.save

    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'

#  redirect_to @affiche_template
end

def showFond
  

  @spectacle=Spectacle.find_by_titre(params[:Spectacle])
  @lieu=Lieu.find(@spectacle.lieu_id)
  lieuMessage="#{@lieu.nom}\n#{@lieu.street}\n#{@lieu.city}"
  frenchWeekdays = ["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"]
  frenchMonths = ["Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre"]
  @dh=[frenchWeekdays[@spectacle.start_time.wday.to_i],@spectacle.start_time.mday.to_s,frenchMonths[@spectacle.start_time.mon]].join(" ")
  @dh+=" à #{@spectacle.start_time.hour}h#{sprintf('%02d',@spectacle.start_time.min)}"


  img = ImageList.new(@affiche_template.fond.url.split("?")[0])
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
  unless params[:teaser].nil? || params[:teaser].empty? then

    @pointsize=getPointSizeBySurface(params[:teaser],img,@affiche_template.teaserwidth.to_f / img.columns.to_f,@affiche_template.teaserheigh.to_f / img.rows.to_f) 

    txt2 = Draw.new
    txt2.pointsize = @pointsize
    txt2.pointsize = @dh_size * 0.7 if @pointsize>(@dh_size * 0.5) 
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

  # Ajout du lieu
  txt3 = Draw.new 
  txt3.pointsize = @dh_size * 0.3
  lieu_texte="#{@lieu.nom}\n#{@lieu.street}\n#{@lieu.city}"
  tx_height=txt3.get_type_metrics(img,lieu_texte)[4]
  tx_height+=tx_height*0.2  
  decay=@affiche_template.lieuy
  lieu_texte.split("\n").each do |l|
    img.annotate(txt3,@affiche_template.lieuwidth,@affiche_template.lieuheigh,@affiche_template.lieux,decay, l){
        txt3.gravity = NorthWestGravity
        txt3.stroke = '#000000'
        txt3.fill = '#ffffff'
        txt3.font_weight = Magick::BoldWeight
    }
    decay+=tx_height
  end

  # ajout du site web
  txt4 = Draw.new   
  txt4.pointsize = @dh_size * 0.3
  ws_texte = "www.ruebarrow.fr"
  tx_height=txt4.get_type_metrics(img,ws_texte)[4]   
  img.annotate(txt4,img.columns,tx_height,0,-img.rows+tx_height,ws_texte){
      txt4.gravity = SouthGravity
      txt4.stroke = '#000000'
      txt4.fill = '#ffffff'
      txt4.font_weight = Magick::BoldWeight
  }

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
