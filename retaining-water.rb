N = gets.to_i
max_x = N
max_y = N
grid = Array.new(max_y) { Array.new(max_x) }

(0...max_y).each do |y|
  row = gets.chomp
  (0...max_x).each do |x|
    grid[y][x] = row[x].ord - 'A'.ord + 1
  end
end

level = grid.map(&:dup)
total_water = 0

(1...(max_y - 1)).each do |y|
  (1...(max_x - 1)).each do |x|
    level[y][x] = 'Z'.ord - 'A'.ord + 1
    total_water += level[y][x] - grid[y][x]
  end
end

loop do
  has_changed = false
  (1...(max_y - 1)).each do |y|
    (1...(max_x - 1)).each do |x|
      lowest_nb = [
        level[y - 1][x],
        level[y][x + 1],
        level[y + 1][x],
        level[y][x - 1]
      ].min
      new_level = [grid[y][x], lowest_nb].max
      if new_level < level[y][x]
        total_water -= (level[y][x] - new_level)
        level[y][x] = new_level
        has_changed = true
      end
    end
  end
  break unless has_changed
end

puts total_water

