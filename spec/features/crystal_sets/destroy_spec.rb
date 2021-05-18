#spec/features/crsystal_sets/destroy

require 'rails_helper'

RSpec.describe 'destroying a crystal set' do
  it 'can delete the crystal set from the index page' do
    set = CrystalSet.create!(collection_name: "Moon Charged Stones", )

    visit '/crystal_sets'

    click_button 'Delete'

    expect(current_path).to eq('/crystal_sets')
  end
end