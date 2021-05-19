#spec/features/crystals/edit
require 'rails_helper'

RSpec.describe 'Crystals edit' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'can edit the crystal' do
    visit "/crystals/#{@emerald.id}"
   
    expect(page).to have_content("Emerald")
    click_button "Edit #{@emerald.name}"
   
    fill_in 'Name', with: "Green Emerald"
    click_button 'Update Crystal'
  end
end