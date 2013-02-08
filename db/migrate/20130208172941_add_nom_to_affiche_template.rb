class AddNomToAfficheTemplate < ActiveRecord::Migration
  def change
    add_column :affiche_templates, :nom, :string
  end
end
