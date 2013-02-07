class Spectacle < ActiveRecord::Base
  attr_accessible :message, :titre, :start_time, :lieu_id, :user_ids
  belongs_to :lieu

  has_and_belongs_to_many :users
end
