grid = []
camp = []
ball = []
attacking_team = ""

15.times do |i|
  pitch_row = gets.chomp[0..99].strip.chars
  if pitch_row.include?("o")
    attacking_team = "a"
    ball = [pitch_row.index("o"), i]
    x = 25
    x = ball[0] if ball[0] < 24
    camp = (1...x).to_a
  end
  if pitch_row.include?("O")
    attacking_team = "b"
    ball = [pitch_row.index("O"), i]
    x = 26
    x = ball[0] if ball[0] > 26
    camp = (x...50).to_a.reverse
  end
  grid << pitch_row
end

if ball[1] == 0 || ball[1] == 14
  puts "No player in an offside position."
  puts "VAR: ONSIDE!"
else
  offside = 0
  if attacking_team == "a"
    number_of_b = 0
    team_a = []
    camp.each do |i|
      number_of_b += grid.count { |row| row[i] == "b" }
      break if number_of_b >= 2
      grid.each do |row|
        letter = row[i]
        if ["a", "A"].include?(letter)
          offside = 1 if letter == "A"
          team_a << letter
        end
      end
    end
    puts "#{team_a.length} player(s) in an offside position." if team_a.length > 0
    puts "No player in an offside position." if team_a.empty?
    puts "VAR: " + (offside == 0 ? "ONSIDE!" : "OFFSIDE!")
  
  elsif attacking_team == "b"
    number_of_a = 0
    team_b = []
    camp.each do |i|
      number_of_a += grid.count { |row| row[i] == "a" }
      break if number_of_a >= 2
      grid.each do |row|
        letter = row[i]
        if ["b", "B"].include?(letter)
          offside = 1 if letter == "B"
          team_b << letter
        end
      end
    end
    puts "#{team_b.length} player(s) in an offside position." if team_b.length > 0
    puts "No player in an offside position." if team_b.empty?
    puts "VAR: " + (offside == 0 ? "ONSIDE!" : "OFFSIDE!")
  end
end