board = []
xQ, yQ = 0, 0
color = gets.chomp
8.times do |i|
  line = gets.chomp
  board << line.chars
  if line.include?('Q')
    xQ, yQ = line.index('Q'), i
  end
end

number_squares = 0

[[-1,-1], [-1,0], [-1,1], [0,-1], [0,1], [1,-1], [1,0], [1,1]].each do |dx, dy|
  x, y = xQ, yQ
  block = false
  while (0 <= x + dx && x + dx < 8 && 0 <= y + dy && y + dy < 8) && !block
    x += dx
    y += dy
    if board[y][x] == '.'
      number_squares += 1
    elsif board[y][x] != color[0]
      number_squares += 1
      block = true
    else
      block = true
    end
  end
end

puts number_squares