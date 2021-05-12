#spec/features/crystals/show_spec.rb
require 'rails_helper'

RSpec.describe 'the crystal show page' do
  it 'displays crystal and attributes' do
    set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    crystal = set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    visit "/crystals/#{crystal.id}"

    expect(page).to have_content(crystal.name)
    expect(page).to have_content(crystal.price)
    expect(page).to have_content(crystal.charged)
    expect(page).to have_content(crystal.description)
  end

  it 'displays crystal set crystal belongs to' do
    set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    crystal = set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    visit "/crystals/#{crystal.id}"

    expect(page).to have_content(crystal.name)
    expect(page).to have_content(crystal.price)
    expect(page).to have_content(crystal.charged)
    expect(page).to have_content(crystal.description)
  end
end