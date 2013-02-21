# encoding: utf-8
class AfficheTemplate < ActiveRecord::Base

require 'RMagick'                                       # Pour faire des choses sur les images (ImageMagick)
include Magick

  attr_accessible :nom,:dhheigh, :dhwidth, :dhx, :dhy, :lieuheigh, :lieuwidth, :lieux, :lieuy, :teaserheigh, :teaserwidth, :teaserx, :teasery

	attr_accessible :fond,:fond_with_blocs
  has_attached_file :fond_with_blocs, :styles => { :showPage => "700x990>" }	
  has_attached_file :fond, :styles => { :thumb => "100x100>", :homePage => "350x495>", :showPage => "700x990>" }

 
  
  def fond_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(fond.url(style))
  end



def genATWithBloc
#  attr_accessible  :lieuheigh, :lieuwidth, :lieux, :lieuy, :teaserheigh, :teaserwidth, :teaserx, :teasery

  # ouverture de l'original pour calculer sa taille
  orig = ImageList.new(fond.url.split("?")[0])  
  @or_x,@or_y = orig.columns,orig.rows
  orig.destroy!

  # ouverture de l'image a modifier
  img = ImageList.new(fond.url(:homePage).split("?")[0])

  # calcul des coeffs ajustés
  @dhx_i = ( dhx.to_f / @or_x * img.columns ).to_i
  @dhx_o = ( ( dhx.to_f + dhwidth )/ @or_x * img.columns ).to_i
  @dhy_i = ( dhy.to_f / @or_y * img.rows ).to_i
  @dhy_o = ( ( dhy.to_f + dhheigh )/ @or_y * img.rows ).to_i
  @dh_size=getPointSize("Date et Heure",img,0.9*dhwidth.to_f / @or_x)

  # Ajout du descriptif
  txt = Draw.new
  txt.pointsize = @dh_size
  img.annotate(txt,@dhx_o-@dhx_i,@dhy_o-@dhy_i,@dhx_i,@dhy_i, "Date et Heure"){
    txt.gravity = CenterGravity
    txt.stroke = 'red'
    txt.fill = 'transparent'
    txt.font_weight = Magick::BoldWeight
  }

  @lieux_i = ( lieux.to_f / @or_x * img.columns ).to_i
  @lieux_o = ( ( lieux.to_f + lieuwidth )/ @or_x * img.columns ).to_i
  @lieuy_i = ( lieuy.to_f / @or_y * img.rows ).to_i
  @lieuy_o = ( ( lieuy.to_f + lieuheigh )/ @or_y * img.rows ).to_i
  @lieu_size=getPointSize("Lieu",img,0.9*lieuwidth.to_f / @or_x)

  # Ajout du descriptif
  txt2 = Draw.new
  txt2.pointsize = @lieu_size
  img.annotate(txt2,@lieux_o-@lieux_i,@lieuy_o-@lieuy_i,@lieux_i,@lieuy_i, "Lieu"){
    txt2.gravity = CenterGravity
    txt2.stroke = 'red'
    txt2.fill = 'transparent'
    txt2.font_weight = Magick::BoldWeight
  }

  @teaserx_i = ( teaserx.to_f / @or_x * img.columns ).to_i
  @teaserx_o = ( ( teaserx.to_f + teaserwidth )/ @or_x * img.columns ).to_i
  @teasery_i = ( teasery.to_f / @or_y * img.rows ).to_i
  @teasery_o = ( ( teasery.to_f + teaserheigh )/ @or_y * img.rows ).to_i
  @teaser_size=getPointSize("Teaser",img,0.9*teaserwidth.to_f / @or_x)

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

	self.update_attributes(:fond_with_blocs => file)
	fond_with_blocs.reprocess!




#    send_data img.to_blob, :stream => 'false', :filename => 'test.jpg', :type => 'image/jpeg', :disposition => 'inline'

end

def creerAffiche!(spectacle,teaser = nil)
#    img.format = 'jpeg'
    file = Tempfile.new('my_picture')
    creerRMAffiche(spectacle,teaser = nil).flatten_images.write(file.path)

	spectacle.update_attributes(:affiche => file)
	spectacle.affiche.reprocess!

end

def creerAffiche(spectacle,teaser = nil)
	    return creerRMAffiche(spectacle,teaser = nil)
	end


private

  def creerRMAffiche(spectacle,teaser = nil)
  @lieu=Lieu.find(spectacle.lieu_id)
  lieuMessage="#{@lieu.nom}\n#{@lieu.street}\n#{@lieu.city}"
  frenchWeekdays = ["Dimanche","Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"]
  frenchMonths = ["Janvier","Fevrier","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre"]
  @dh=[frenchWeekdays[spectacle.start_time.wday.to_i],spectacle.start_time.mday.to_s,frenchMonths[spectacle.start_time.mon]].join(" ")
  @dh+=" à #{spectacle.start_time.hour}h#{sprintf('%02d',spectacle.start_time.min)}"


  img = ImageList.new(fond.url.split("?")[0])
  @dh_size=getPointSize(@dh,img,dhwidth.to_f / img.columns.to_f)

  # Ajout de la date et de l'heure
  txt = Draw.new
  txt.pointsize = @dh_size
  img.annotate(txt,dhwidth,dhheigh,dhx,dhy, @dh){
    txt.gravity = CenterGravity
    txt.stroke = '#000000'
    txt.fill = '#ffffff'
    txt.font_weight = Magick::BoldWeight
  }

  # Ajout du teaser
  unless (spectacle.teaser.nil? || spectacle.teaser.empty? ) && teaser == nil then
  	if teaser == nil then @teaser_to_use = spectacle.teaser else @teaser_to_use = teaser end

    @pointsize=getPointSizeBySurface(@teaser_to_use,img,teaserwidth.to_f / img.columns.to_f,teaserheigh.to_f / img.rows.to_f) 

    txt2 = Draw.new
    txt2.pointsize = @pointsize
    txt2.pointsize = @dh_size * 0.7 if @pointsize>(@dh_size * 0.5) 
    @lines = constructLines(@teaser_to_use,txt2,teaserwidth,img)
    tx_height=txt2.get_type_metrics(img,@teaser_to_use)[4]
    tx_height+=tx_height*0.2

    decay=teasery
    @lines.each do |l|
      img.annotate(txt2,teaserwidth,teaserheigh,teaserx,decay, l){
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
  decay=lieuy
  lieu_texte.split("\n").each do |l|
    img.annotate(txt3,lieuwidth,lieuheigh,lieux,decay, l){
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

  return img
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

end
