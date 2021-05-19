#spec/features/crystal_sets/show_spec.rb
require 'rails_helper'

RSpec.describe 'the crystal set show page' do
  before :each do
    @set_1 = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: true, inventory: 3)
    @set_2 = CrystalSet.create!(collection_name: "Moonlight ", limited_edition: false, inventory: 10)
  end 

  it 'displays crystal set and its attributes' do
    visit "/crystal_sets/#{@set_1.id}"

    expect(page).to have_content(@set_1.collection_name)
    expect(page).to have_content(@set_1.limited_edition)
    expect(page).to have_content(@set_1.inventory)
    expect(page).to_not have_content(@set_2.collection_name)
  end

  it 'displays number of crystals in crystal set' do
    visit "/crystal_sets/#{@set_1.id}"

    expect(page).to have_content(@set_1.crystal_count)
  end

  it 'links to crystal set index page' do
    visit "/crystal_sets/#{@set_1.id}"

    expect(page).to have_link("Crystal Sets", href: "/crystal_sets")
  end
  
  it 'links to the edit page' do
    visit "/crystal_sets/#{@set_1.id}"
    click_button "Edit #{@set_1.collection_name}"

    expect(current_path).to eq("/crystal_sets/#{@set_1.id}/edit")
  end

  it 'links to index page of all crystals in crystal set' do
    visit "/crystal_sets/#{@set_1.id}"

    expect(page).to have_link("#{@set_1.crystal_count}", href: "/crystal_sets/#{@set_1.id}/crystals")
  end

  it 'can delete crystal sets from show page' do
    visit "/crystal_sets/#{@set_1.id}"

    expect(page).to have_content("Raw Crystal Chunks - 28pc")

    click_button 'Delete'

    expect(page).to_not have_content("Raw Crystal Chunks - 28pc")
    expect(current_path).to eq("/crystal_sets")
  end
end