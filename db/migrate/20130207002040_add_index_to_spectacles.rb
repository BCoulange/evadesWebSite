class AddIndexToSpectacles < ActiveRecord::Migration
  add_index :spectacles, :lieu_id
end
