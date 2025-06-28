def get_score(cards)
  card_value = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '10' => 10, 'J' => 10, 'Q' => 10, 'K' => 10 }    
  # We have to check the aces last
  cards.sort_by! { |card| card == "A" ? 1 : 0 }

  score = 0

  cards.each do |card|
    if card == "A"
      score += (score + 11 > 21) ? 1 : 11
    else
      score += card_value[card]
    end
  end

  [score, score == 21 && cards.size == 2]
end

bank_score, bank_blackjack = get_score(gets.strip.split)
player_score, player_blackjack = get_score(gets.strip.split)

if player_blackjack && !bank_blackjack
  puts "Blackjack!"
elsif player_score > 21 || (bank_score > player_score && bank_score <= 21)
  puts "Bank"
elsif player_score == bank_score
  puts "Draw"
else
  puts "Player"
end

