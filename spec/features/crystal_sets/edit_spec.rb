#/spec/features/crystal_sets/edit_spec
require 'rails_helper'

RSpec.describe 'Crystal sets edit' do 
  it 'links to the edit page' do
    set = CrystalSet.create!(collection_name: "5 Different Rough Stones", limited_edition: false , inventory: 40) 
    visit "/crystal_sets/#{set.id}"

    click_button "Edit #{set.collection_name}"

    expect(current_path).to eq("/crystal_sets/#{set.id}/edit")
  end

  it 'can edit the crystal set' do
    set = CrystalSet.create!(collection_name: "5 Different Rough Stones", limited_edition: false , inventory: 40) 
    visit "/crystal_sets/#{set.id}"

    expect(page).to have_content("5 Different Rough Stones")
    click_button "Edit #{set.collection_name}"

    fill_in 'Collection Name', with: "4 Different Rough Stones"
    click_button'Update Crystal Set'
    save_and_open_page
    expect(current_path).to eq("/crystal_sets")
    expect(page).to have_content("4 Different Rough Stones")
  end
end