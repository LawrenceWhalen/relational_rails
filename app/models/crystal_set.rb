#app/models/crystal_set

class CrystalSet < ApplicationRecord
  has_many :crystals

  def self.order_by_most_recently_created
    self.all.order(:created_at).reverse_order 
  end

  def crystal_count
    self.crystals.count
  end
end