class CreateSpectacles < ActiveRecord::Migration
  def change
    create_table :spectacles do |t|
      t.string :titre
      t.string :message
      t.string :date

      t.timestamps
    end
  end
end
