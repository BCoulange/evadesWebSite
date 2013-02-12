class AfficheTemplate < ActiveRecord::Base

  attr_accessible :nom,:dhheigh, :dhwidth, :dhx, :dhy, :lieuheigh, :lieuwidth, :lieux, :lieuy, :teaserheigh, :teaserwidth, :teaserx, :teasery

	attr_accessible :fond
  has_attached_file :fond, :styles => { :thumb => "100x100>", :homePage => "350x495>", :showPage => "700x990>" }

end
