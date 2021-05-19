#spec/features/crystal_sets/new_spec.rb 
require 'rails_helper'

RSpec.describe 'Crystal Set creation' do
  it 'can create new crystal set' do
    visit '/crystal_sets/new'

    fill_in "Collection Name", with: "Starter Crystal Set with 5 Stones"
    check "Limited Edition?"
    fill_in "Inventory", with: 100
    click_button "Create Crystal Set"

    expect(current_path).to eq("/crystal_sets")
  end
end