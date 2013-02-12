class SupprGmapsToLieus < ActiveRecord::Migration
	 def change
		remove_column :lieus, :gMapUrl
	end
end
