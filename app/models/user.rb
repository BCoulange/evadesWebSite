class User < ActiveRecord::Base
  attr_accessible :nom, :prenom, :surnom, :spectacle_ids

  has_and_belongs_to_many :spectacles
end
