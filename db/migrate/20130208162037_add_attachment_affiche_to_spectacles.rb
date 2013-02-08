class AddAttachmentAfficheToSpectacles < ActiveRecord::Migration
  def self.up
    change_table :spectacles do |t|
      t.attachment :affiche
    end
  end

  def self.down
    drop_attached_file :spectacles, :affiche
  end
end
