class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  validates :avatar, :attachment_presence => true        


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :nom, :prenom, :surnom, :spectacle_ids
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x200#", :thumb => "100x60#", :large => "800x800>" }

  has_and_belongs_to_many :spectacles
end
