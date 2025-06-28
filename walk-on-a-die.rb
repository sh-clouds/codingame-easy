move = {
  'R' => [4, 0, 3, 5, 1, 2],
  'L' => [4, 5, 1, 0, 3, 2],
  'U' => [4, 1, 0, 3, 5, 2],
  'D' => [4, 3, 5, 1, 0, 2]
}

dice = ""

3.times do
  dice += gets.strip
end

commands = gets.chomp

commands.each_char do |command|
  temp = dice
  dice = ""
  temp.length.times do |index|
    dice += temp[move[command][index]]
  end
end

puts dice[2]
