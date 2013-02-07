class Lieu < ActiveRecord::Base
  attr_accessible :adresse, :gMapUrl, :nom
  has_many :spectacles
end
