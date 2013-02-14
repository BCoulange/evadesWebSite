class Spectacle < ActiveRecord::Base
  attr_accessible :message, :titre, :start_time, :lieu_id, :user_ids, :teaser
  belongs_to :lieu

  has_and_belongs_to_many :users

    validates :teaser, :length => { :maximum => 500 }

	attr_accessible :affiche
  has_attached_file :affiche, :styles => { :homePage => "350x495>", :showPage => "700x990>" }


end
