class CreateMailings < ActiveRecord::Migration
  def change
    create_table :mailings do |t|
      t.string :nom
      t.string :email

      t.timestamps
    end
  end
end
