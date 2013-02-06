class CreateLieus < ActiveRecord::Migration
  def change
    create_table :lieus do |t|
      t.string :nom
      t.string :adresse
      t.string :gMapUrl

      t.timestamps
    end
  end
end
