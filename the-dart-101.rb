number_of_players = gets.to_i
players = []
performance = []

number_of_players.times do
  players << gets.chomp
end

number_of_players.times do |index|
  shoots = gets.chomp.split
  score = 0
  last_shot = ""
  consecutive_shots = 0
  shot_counter = 0
  rounds = 1

  shoots.each do |shot|
    if shot == "X"
      consecutive_shots += 1
      shot_counter += 1
      if last_shot == "X" && consecutive_shots == 2 && shot_counter != 1
        score -= 30
      elsif last_shot == "X" && consecutive_shots == 3 && shot_counter == 3
        score = 0
      else
        score -= 20
      end
      last_shot = "X"
    else
      points = eval(shot)
      if points + score <= 101
        score += points
        shot_counter += 1
      else
        rounds += 1
        shot_counter = 0
      end
      last_shot = shot
      consecutive_shots = 0
    end

    if shot_counter == 3
      shot_counter = 0
      consecutive_shots = 0
      rounds += 1
    end
  end

  performance << [score, rounds, index]
end

performance.sort! { |a, b| [ -a[0], a[1] ] <=> [ -b[0], b[1] ] }
puts players[performance[0][2]]