class CreateReunionCas < ActiveRecord::Migration
  def change
    create_table :reunion_cas do |t|
      t.string :compterendu

      t.timestamps
    end
  end
end
