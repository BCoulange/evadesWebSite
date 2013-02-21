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

private

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

end
