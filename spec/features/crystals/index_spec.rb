#spec/features/crystals/index_spec.rb
require 'rails_helper'

RSpec.describe 'crystals index' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'lists all crystals' do
    visit "/crystals"

    expect(page).to have_content(@larimar.name)
    expect(page).to have_content(@larimar.price)
    expect(page).to have_content(@larimar.charged)
    expect(page).to have_content(@larimar.description)
    expect(page).to have_content(@emerald.name)
    expect(page).to have_content(@emerald.price)
    expect(page).to have_content(@emerald.charged)
    expect(page).to have_content(@emerald.description)
  end
  
end