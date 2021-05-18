#spec/features/crystal_sets/crystals/index_spec
require 'rails_helper'

RSpec.describe 'crystal set crystals index' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'shows all crystal set name' do
    visit "/crystal_sets/#{@set.id}/crystals"

    expect(page).to have_content(@set.collection_name)
  end

  it 'shows all the crystals in the crystal set' do
    visit "/crystal_sets/#{@set.id}/crystals"

    expect(page).to have_content(@larimar.name)
    expect(page).to have_content(@emerald.name)
  end

  it 'links to each crystal show page' do
    visit "/crystal_sets/#{@set.id}/crystals"
    click_on @larimar.name
    
    expect(current_path).to eq("/crystals/#{@larimar.id}")
  end

  it 'links to crystal sets index page' do
    visit "/crystals"
    click_on "Crystal Sets"

    expect(current_path).to eq("/crystal_sets")
  end

  it 'links to crystals index page' do
    visit "/crystal_sets/#{@set.id}/crystals"
    click_on "All Crystals"

    expect(current_path).to eq("/crystals")
  end

  it 'links to alphabetically ordered index' do
    visit "/crystal_sets/#{@set.id}/crystals"
    click_link "Sort Alphabetically"
    expect(@larimar.name).to appear_before(@emerald.name, only_text: true)
    save_and_open_page  
    expect(@emerald.name).to appear_before(@larimar.name, only_text: true)
    expect(current_path).to eq("/crystals/#{@set.id}/crystals")
  end
end