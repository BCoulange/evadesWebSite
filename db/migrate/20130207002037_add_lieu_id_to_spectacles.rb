class AddLieuIdToSpectacles < ActiveRecord::Migration
  def change
    add_column :spectacles, :lieu_id, :integer
  end

end
