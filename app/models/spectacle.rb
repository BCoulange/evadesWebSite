class Spectacle < ActiveRecord::Base
  attr_accessible :message, :titre, :start_time, :lieu_id, :user_ids
  belongs_to :lieu

  has_and_belongs_to_many :users

	attr_accessible :affiche
  has_attached_file :affiche, :styles => { :homePage => "350x495>", :showPage => "700x990>" }

end
