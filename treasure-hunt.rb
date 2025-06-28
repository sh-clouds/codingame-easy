# Form grid and find starting position.
height, width = gets.chomp.split.map(&:to_i)
grid = []
starting_position = [-1, -1]
(0...height).each do |i|
  row = gets.chomp
  grid << row
  (0...width).each do |j|
    if grid[i][j] == "X" && starting_position == [-1, -1]
      starting_position = [i, j]
    end
  end
end

def search(grid, i, j, current_gold, visited)
  # End case.
  return 0 if i < 0 || i >= grid.length || j < 0 || j >= grid[0].length || grid[i][j] == "#"

  # Goal case.
  if grid[i][j].match?(/\d/)
    current_gold += grid[i][j].to_i
    $max_gold = current_gold if current_gold > $max_gold
  end

  # Search case.
  [[1, 0], [-1, 0], [0, 1], [0, -1]].each do |dy, dx|
    new_position = [i + dy, j + dx]
    unless visited.include?(new_position)
      visited << new_position
      search(grid, i + dy, j + dx, current_gold, visited.dup)
    end
  end
end

# Search for max gold. 
$max_gold = 0
search(grid, starting_position[0], starting_position[1], 0, [starting_position.dup])
puts $max_gold