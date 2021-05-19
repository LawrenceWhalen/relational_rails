#spec/features/crystals/index_spec.rb
require 'rails_helper'

RSpec.describe 'crystals index' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
  end

  it 'lists all crystals and attributes' do
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

  it 'links to crystal sets index page' do
    visit "/crystals"
    click_on "Crystal Sets"

    expect(current_path).to eq("/crystal_sets")
  end

  it 'links to each crystal show page' do
    visit "/crystal_sets/#{@set.id}/crystals"
    click_on @larimar.name

    expect(current_path).to eq("/crystals/#{@larimar.id}")
  end

  it 'links to the edit page' do
    visit "/crystals"

    click_button "Edit #{@larimar.name}"

    expect(current_path).to eq("/crystals/#{@larimar.id}/edit")
  end

  it 'can delete crystal from index page' do
    visit '/crystals'

    expect(page).to have_content("Larimar")
    expect(page).to have_content("Emerald")

    within first(".crystal") do
      click_button 'Delete'
    end

    expect(page).to_not have_content("Larimar")
    expect(page).to have_content("Emerald")
    expect(current_path).to eq('/crystals')
  end
end