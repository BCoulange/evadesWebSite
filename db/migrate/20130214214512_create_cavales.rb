class CreateCavales < ActiveRecord::Migration
  def change
    create_table :cavales do |t|
      t.string :titre
      t.string :message

      t.timestamps
    end
  end
end
