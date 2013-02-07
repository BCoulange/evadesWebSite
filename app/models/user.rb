class User < ActiveRecord::Base
  attr_accessible :email, :nom, :prenom, :surnom

  has_and_belongs_to_many :spectacles
end
