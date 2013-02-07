class CreateSpectaclesUsers < ActiveRecord::Migration
  def change
  	  create_table :spectacles_users, :id => false do |t|
      t.integer :spectacle_id
      t.integer :user_id
    end
  end

end


