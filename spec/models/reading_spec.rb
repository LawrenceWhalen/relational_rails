require 'rails_helper'

RSpec.describe Reading, type: :model do
  it {should belong_to :tarot_deck}

  before :each do
    @deck_1 = TarotDeck.create!(name: 'Programs', number_made: 15, pre_owned: false)

    @reading_1 = @deck_1.readings.create(
      spread: 'ZZZ',
      major_reading: true,
      cards_drawn: 'Empress Fool',
      attendees_num: 6,
      interpretation: 'I am doomed',
      created_at: '2020-01-01'
    )
    @reading_2 = @deck_1.readings.create(
      spread: 'AAA',
      major_reading: false,
      cards_drawn: 'Fool Maji',
      attendees_num: 18,
      interpretation: 'I will live',
      created_at: '2021-01-01'
    )
  end
  it 'has a default order' do

    expect(Reading.alphabatize).to eq([@reading_2, @reading_1])

  end
  it 'has an alphabatized order' do

    expect(Reading.default).to eq([@reading_1, @reading_2])

  end
  it 'has the ability to show only major readings' do

    expect(Reading.major_readings).to eq([@reading_1])

  end
  it 'can show only readings with a minimum attendance' do

    expect(Reading.attend(10)).to eq([@reading_2])

  end
end
