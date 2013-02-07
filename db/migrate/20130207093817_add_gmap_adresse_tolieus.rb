class AddGmapAdresseTolieus < ActiveRecord::Migration
	 def change
		remove_column :lieus, :adresse
		add_column :lieus, :street,  :string #you can change the name, see wiki
		add_column :lieus, :city,  :string #you can change the name, see wiki
		add_column :lieus, :country,  :string #you can change the name, see wiki		
		add_column :lieus, :latitude,  :float #you can change the name, see wiki
		add_column :lieus, :longitude, :float #you can change the name, see wiki
		add_column :lieus, :gmaps, :boolean #not mandatory, see wiki
	end
end

