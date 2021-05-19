#app/models/crystal_set

class CrystalSet < ApplicationRecord
  has_many :crystals, dependent: :delete_all

  def self.order_by_most_recently_created
    order(:created_at).reverse_order 
  end

  def crystal_count
    crystals.count
  end

  def shows_crystals_pricier_than(price)
    crystals.where("price > ?", price)
  end
end