class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tarot_decks do |t|
      t.string :name
      t.integer :number_made
      t.boolean :pre_owned
      t.string :major_readings
      t.timestamps
    end
  end
end
