require 'rails_helper'

RSpec.describe CrystalSet do
  it {should have_many :crystals}

  describe 'methods' do
    before :each do
      @set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
      @set_2 = CrystalSet.create!(collection_name: "Starter Set 4 Stones", limited_edition: false, inventory: 100)
      @larimar = @set_1.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
      @emerald = @set_1.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
    end

    it '::order_by_most_recently_created' do
      
      expect(CrystalSet.order_by_most_recently_created).to eq([@set_2, @set_1])
    end
    
    it '#crystal_count' do

      expect(@set_1.crystal_count).to eq(2)
    end

    it '#shows_crystals_pricier_than' do
      
      expect(@set_1.shows_crystals_pricier_than(10.99)).to eq([@emerald])
    end
  end
end