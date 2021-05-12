#spec/features/crystals/show_spec.rb
require 'rails_helper'

RSpec.describe 'the crystal show page' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'displays crystal and attributes' do
    visit "/crystals/#{@larimar.id}"

    expect(page).to have_content(@larimar.name)
    expect(page).to have_content(@larimar.price)
    expect(page).to have_content(@larimar.charged)
    expect(page).to_not have_content(@emerald.name)
  end

  it 'displays crystal set crystal belongs to' do
    visit "/crystals/#{@larimar.id}"
  
    expect(page).to have_content(@larimar.crystal_set.collection_name)
    expect(page).to_not have_content(@emerald.crystal_set)
  end
end