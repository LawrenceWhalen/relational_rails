require 'rails_helper'

RSpec.describe TarotDeck do
  # it {should have_many :readings}

  describe 'instance methods' do
    before :each do
      @deck_1 = TarotDeck.create!(name: 'Programs', number_made: 15, pre_owned: false, created_at: '2021-01-01')
      @deck_2 = TarotDeck.create!(name: 'Programs', number_made: 15, pre_owned: true, created_at: '2020-01-01')

      reading_1 = @deck_1.readings.create(
        spread: 'Three Card',
        major_reading: true,
        cards_drawn: 'Empress Fool',
        attendees_num: 6,
        interpretation: 'I am doomed'
      )
      reading_2 = @deck_1.readings.create(
        spread: 'Five Card',
        major_reading: false,
        cards_drawn: 'Fool Maji',
        attendees_num: 18,
        interpretation: 'I will live'
      )
    end

    describe 'readings' do
      it 'creates a readings linked to the deck' do
        reading_3 = @deck_1.readings.create(
          spread: 'Five Card',
          major_reading: false,
          cards_drawn: 'Fool Maji',
          attendees_num: 18,
          interpretation: 'I will live'
        )

        expect(reading_3.tarot_deck_id).to eq(@deck_1.id)
        expect(reading_3.class).to eq(Reading)
      end
    end

    describe '#reading_count' do
      it 'returns the number of readings linked to the deck' do
        expect(@deck_1.reading_count).to eq(2)
      end
    end

    describe '#order_created' do
      it 'orders decks by date created' do
        expect(TarotDeck.order_created).to eq([@deck_1, @deck_2])
      end
    end
  end
end
