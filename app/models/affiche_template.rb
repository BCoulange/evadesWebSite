class AfficheTemplate < ActiveRecord::Base

  attr_accessible :nom,:dhheigh, :dhwidth, :dhx, :dhy, :lieuheigh, :lieuwidth, :lieux, :lieuy, :teaserheigh, :teaserwidth, :teaserx, :teasery

	attr_accessible :fond,:fond_with_blocs
  has_attached_file :fond_with_blocs, :styles => { :showPage => "700x990>" }	
  has_attached_file :fond, :styles => { :thumb => "100x100>", :homePage => "350x495>", :showPage => "700x990>" }

 
  
  def fond_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(fond.url(style))
  end

end
