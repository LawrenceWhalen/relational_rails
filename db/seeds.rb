# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TarotDeck.destroy_all
Reading.destroy_all

deck = TarotDeck.create!(name: 'Programs', number_made: 15, pre_owned: false)
deck.readings.create!(spread: 'Three Card', major_reading: true, cards_drawn: 'Empress Fool', attendees_num: 6, interpretation: 'I am doomed')
deck.readings.create!(spread: 'Celtic Cross', major_reading: false, cards_drawn: 'Six of Wands Seven of Pentacles', attendees_num: 1, interpretation: 'Looks good')

@set = CrystalSet.create!(collection_name: "Raw Crystal Chunks - 28pc", limited_edition: false, inventory: 1000)
@set = CrystalSet.create!(collection_name: "Intuitively Chosen Raw Crystals", limited_edition: true, inventory: 250)
@larimar = @set.crystals.create!(name: "Larimar", price: 4.55, charged: true, description: "Peace/Relaxation/Communication")
@emerald = @set.crystals.create!(name: "Emerald", price: 100.99, charged: true, description: "Love/Compassion/Abundance")

