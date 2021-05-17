#app/models/crystal_set

class CrystalSet < ApplicationRecord
  has_many :crystals

  def crystal_count
    self.crystals.count
  end
end