#/spec/features/crystal_sets/edit_spec
require 'rails_helper'

RSpec.describe 'Crystal sets edit' do 
  it 'links to the edit page' do
    set = CrystalSet.create!(collection_name: "5 Different Rough Stones", limited_edition: false , inventory: 40) 
    visit "/crystal_sets"

    click_button "Edit #{set.id}"

    expect(current_path).to eq("/crystal_sets/#{set.id}")
  end

  it 'can edit the crystal set' do
    set = CrystalSet.create!(collection_name: "5 Different Rough Stones", limited_edition: false , inventory: 40) 
    visit "/crystal_sets"

    expect(page).to have_content("5 Different Rough Stones")

    click_button "Edit #{set.id}"

    fill_in 'Collection Name', with: "4 Different Rough Stones"
    click_button 'Update Set'

    expect(current_path).to eq("/crystal_sets")
    expect(page).to have_content("4 Different Rough Stones")
  end
end