class AddStartTimeToSpectacle < ActiveRecord::Migration
  def change
    add_column :spectacles, :start_time, :datetime
  end
end
