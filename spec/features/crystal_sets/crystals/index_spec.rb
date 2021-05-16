#spec/features/crystal_sets/crystals/index_spec

require 'rails_helper'

RSpec.describe 'crystal set crystals index' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'shows all crystal_set name' do
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

  it 'links to crystal set index page' do
    visit "/crystal_sets/#{@set.id}/crystals"

    save_and_open_page

    expect(page).to have_link("Back to Crystal Sets", href: '/crystal_sets')
  end
end