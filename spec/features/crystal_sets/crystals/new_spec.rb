#spec/features/crystal_sets/crystals/new
require 'rails_helper'

RSpec.describe 'Crystal Set Crystal creation' do
  before :each do 
    @set = CrystalSet.create!(collection_name: "5 Different Rough Stones", limited_edition: false , inventory: 40) 
  end

  it 'links to the new page from set crystal index' do
    visit "/crystal_sets/#{@set.id}/crystals"

    click_link "Add Crystal"
 
    expect(current_path).to eq("/crystal_sets/#{@set.id}/crystals/new")
  end

  it 'can create a new crystal' do
    visit "/crystal_sets/#{@set.id}/crystals/new"
    
    expect(current_path).to eq("/crystal_sets/#{@set.id}/crystals/new")

    fill_in "Name", with: "Amethyst"
    fill_in "Price", with:  12.99
    uncheck "Charged?"
    fill_in "Description", with: "Stress Relief/Protection"
    click_button("Create Crystal")

    expect(current_path).to eq("/crystal_sets/#{@set.id}/crystals")
  end
end