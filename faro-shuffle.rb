# Get card amount and deck.
number_of_cards = gets.to_i
deck = gets.split

# Complete algorithm number_of_cards times.
number_of_cards.times do
    new_deck = []
    pile1 = deck[0...(deck.length / 2.0).ceil] 
    pile2 = deck[(deck.length / 2.0).ceil...deck.length] 
    pile1.zip(pile2) do |card1, card2|
        new_deck << card1
        new_deck << card2 if card2
    end
    new_deck << pile1.last if pile1.length > pile2.length
    deck = new_deck
end

# Print shuffled deck.
puts deck.uniq.join(" ")