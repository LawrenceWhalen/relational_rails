#spec/features/crystal_sets/crystals/index_spec
require 'rails_helper'

RSpec.describe 'crystal set crystals index' do
  before :each do
    @set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
    @emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")
    @amethyst = @set.crystals.create!(name: "Amethyst", price: 12.99, charged: false, description: "Safety/Protection")
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

  it 'links to the edit page' do
    visit "/crystal_sets/#{@set.id}/crystals"
    click_button "Edit #{@larimar.name}"

    expect(current_path).to eq("/crystals/#{@larimar.id}/edit")
  end

  it 'can delete crystal from index page' do
    visit "/crystal_sets/#{@set.id}/crystals"

    expect(page).to have_content("Larimar")

    within first(".set_crystal") do
      click_button 'Delete'
    end

    expect(page).to_not have_content("Larimar")
    expect(current_path).to eq('/crystals')
  end

  it 'links to alphabetically ordered index' do
    visit "/crystal_sets/#{@set.id}/crystals"

    expect(@larimar.name).to appear_before(@emerald.name, only_text: true)

    click_link "Sort Alphabetically"

    expect(@emerald.name).to appear_before(@larimar.name, only_text: true)
    expect(current_path).to eq("/crystal_sets/#{@set.id}/crystals/")
  end

  it 'show crystals that cost more than certain price' do
    visit "/crystal_sets/#{@set.id}/crystals"

    expect(page).to have_content("Show Crystals That Cost >")

    fill_in :crystals_by_price, with: 10.00  
    click_button "Show Me The Crystals!"

    expect(page).to_not have_content(@larimar.name)
    expect(page).to have_content(@emerald.name)
    expect(page).to have_content(@amethyst.name)

    fill_in :crystals_by_price, with: 100.00  
    click_button "Show Me The Crystals!"

    expect(page).to_not have_content(@larimar.name)
    expect(page).to_not have_content(@amethyst.name)
    expect(page).to have_content(@emerald.name)
  end

  it 'links to the new page from set crystal index' do
    visit "/crystal_sets/#{@set.id}/crystals"
    click_button "Add Crystal"

    expect(current_path).to eq("/crystal_sets/#{@set.id}/crystals/new")
  end
end