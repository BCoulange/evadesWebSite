class Lieu < ActiveRecord::Base
  attr_accessible :street,:city,:country, :nom,:latitude,:longitude,:gmaps
  has_many :spectacles

acts_as_gmappable

def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  "#{self.street}, #{self.city}, #{self.country}" 
end

end
