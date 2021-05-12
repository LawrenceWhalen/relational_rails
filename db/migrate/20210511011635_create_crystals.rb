class CreateCrystals < ActiveRecord::Migration[5.2]
  def change
    create_table :crystals do |t|
      t.string :name
      t.float :price
      t.boolean :charged
      t.string :description
      t.timestamps
    end
  end
end
