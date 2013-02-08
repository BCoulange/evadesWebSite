class AddAttachmentFondToAfficheTemplates < ActiveRecord::Migration
  def self.up
    change_table :affiche_templates do |t|
      t.attachment :fond
    end
  end

  def self.down
    drop_attached_file :affiche_templates, :fond
  end
end
