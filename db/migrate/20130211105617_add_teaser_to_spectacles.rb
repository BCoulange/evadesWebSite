class AddTeaserToSpectacles < ActiveRecord::Migration
  def change
  	add_column :spectacles, :teaser, :string
  end
end
