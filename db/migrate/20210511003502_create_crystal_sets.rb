class CreateCrystalSets < ActiveRecord::Migration[5.2]
  def change
    create_table :crystal_sets do |t|
      t.string :collection_name
      t.boolean :limited_edition
      t.integer :inventory 
      t.timestamps 
    end
  end
end
