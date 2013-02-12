class Mailing < ActiveRecord::Base
  attr_accessible :email, :nom

  validates :email, :uniqueness => true
end
