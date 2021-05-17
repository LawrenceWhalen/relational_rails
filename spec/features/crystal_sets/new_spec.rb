#spec/features/crystal_sets/new_spec.rb 
require 'rails_helper'

RSpec.describe 'Crystal Set creation' do
  it 'links to the new page from crystal set from crsytal set index' do
    visit '/crystal_sets'
    click_link 'New Crystal Set'
    expect(current_path).to eq('/crystal_sets/new')
  end

  it 'can create a new crystal set' do
    visit '/crystal_sets/new'

    expect(current_path).to eq("/crystal_sets/new")

    fill_in "Collection Name", with: "Starter Crystal Set with 5 Stones"
    check "Limited Edition?"
    click_button("Create Crystal Set")

    expect(current_path).to eq("/crystal_sets")
  end
end