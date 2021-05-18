class AddCrystalToCrystalSet < ActiveRecord::Migration[5.2]
  def change
    add_reference :crystals, :crystal_set, foreign_key: true
  end
end
