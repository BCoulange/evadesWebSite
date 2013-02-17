class AddStartTimeToReunionCas < ActiveRecord::Migration
  def change
    add_column :reunion_cas, :start_time, :datetime
  end
end
