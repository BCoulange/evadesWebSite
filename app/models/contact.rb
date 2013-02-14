class Contact

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  	
  attr_accessor :prenom, :nom,:entreprise,:email,:message


  validates :message, :email, :presence => true
  validates :email, :format => { :with => %r{.+@.+\..+} }


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

end
