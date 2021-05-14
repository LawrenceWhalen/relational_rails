class CreateReading < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.string :spread
      t.boolean :major_reading
      t.string :cards_drawn
      t.integer :attendees_num
      t.string :interpretation
      t.timestamps
    end
  end
end
