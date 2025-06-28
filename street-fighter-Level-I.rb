require 'json'

champion_one, champion_two = gets.split
attack_list = []

number_of_attacks = gets.to_i
number_of_attacks.times do
  attack_list << gets.split
end

fighter_stats = {
  "KEN" => [25, 6, 5, 0, 0],
  "RYU" => [25, 4, 5, 0, 0],
  "TANK" => [50, 2, 2, 0, 0],
  "VLAD" => [30, 3, 3, 0, 0],
  "JADE" => [20, 2, 7, 0, 0],
  "ANNA" => [18, 9, 1, 0, 0],
  "JUN" => [60, 2, 1, 0, 0]
}

attacker = ""
defender = ""
hits = 0

attack_list.each do |attack|
  if attack[0] == ">"
    attacker = champion_one
    defender = champion_two
  else
    attacker = champion_two
    defender = champion_one
  end

  if attack[1] == "SPECIAL"
    case attacker
    when "KEN"
      fighter_stats[defender][0] -= fighter_stats[attacker][3] * 3
    when "RYU"
      fighter_stats[defender][0] -= fighter_stats[attacker][3] * 4
    when "TANK"
      fighter_stats[defender][0] -= fighter_stats[attacker][3] * 2
    when "VLAD"
      fighter_stats[defender][0] -= (fighter_stats[defender][3] + fighter_stats[attacker][3]) * 2
      fighter_stats[defender][3] = 0
    when "JADE"
      fighter_stats[defender][0] -= fighter_stats[attacker][3] * fighter_stats[attacker][4]
    when "ANNA"
      fighter_stats[defender][0] -= fighter_stats[attacker][3] * (18 - fighter_stats[attacker][0])
    when "JUN"
      fighter_stats[defender][0] -= fighter_stats[attacker][3]
      fighter_stats[attacker][0] += fighter_stats[attacker][3]
    end
    fighter_stats[attacker][3] = 0
    fighter_stats[attacker][4] += 1
    fighter_stats[defender][3] += 1
  else
    fighter_stats[attacker][4] += 1
    fighter_stats[defender][3] += 1
    if attack[1] == "KICK"
      fighter_stats[defender][0] -= fighter_stats[attacker][2]
    else
      fighter_stats[defender][0] -= fighter_stats[attacker][1]
    end
  end
  break if fighter_stats[defender][0] <= 0
end

if fighter_stats[champion_one][0] > fighter_stats[champion_two][0]
  attacker = champion_one
  defender = champion_two
else
  attacker = champion_two
  defender = champion_one
end

hits = fighter_stats[attacker][4]

puts "#{attacker} beats #{defender} in #{hits} hits"