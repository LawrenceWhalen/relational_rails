#spec/features/crystals/edit
require 'rails_helper'

RSpec.describe 'Crystals edit' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'links to the edit page' do
    visit "/crystals/#{@larimar.id}"

    click_button "Edit #{@larimar.name}"

    expect(current_path).to eq("/crystals/#{@larimar.id}/edit")
  end
end