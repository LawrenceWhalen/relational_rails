require 'rails_helper'

RSpec.describe CrystalSet do
  it {should have_many :crystals}

  describe 'instance methods' do
    before :each do
      @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
      @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
      @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
    end

    it 'returns number of crystals in crystal set' do

      expect(@set.crystal_count).to eq(2)
    end
  end
end