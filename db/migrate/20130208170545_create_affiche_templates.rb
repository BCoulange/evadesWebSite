class CreateAfficheTemplates < ActiveRecord::Migration
  def change
    create_table :affiche_templates do |t|
      t.integer :teaserwidth
      t.integer :teaserheigh
      t.integer :teaserx
      t.integer :teasery
      t.integer :lieuwidth
      t.integer :lieuheigh
      t.integer :lieux
      t.integer :lieuy
      t.integer :dhwidth
      t.integer :dhheigh
      t.integer :dhx
      t.integer :dhy

      t.timestamps
    end
  end
end
