require 'rails_helper'

# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

RSpec.describe CrystalSet do
  it {should have_many :crystals}

  describe 'instance methods' do
    set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: false, inventory: 1000)
    set_2 = CrystalSet.create!(collection_name: "Intuitively Chosen Raw Crystals", limited_edition: true, inventory: 250)
    sets = [set_1, set_2]
    
    expect(sets.order).to eq([set_2, set_1])
  end
end