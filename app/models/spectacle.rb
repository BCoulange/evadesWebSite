class Spectacle < ActiveRecord::Base
  attr_accessible :message, :titre, :start_time
  belongs_to :lieu
end
