# Get grid dimensions and bounce limit.
width = gets.to_i + 2
height = gets.to_i + 2
bounces_limit = gets.to_i

# Set starting position.
row_index = 1
column_index = 1

# Set directions.
direction_index = 0
directions = {0 => [1, 1], 1 => [-1, 1], 2 => [1, -1], 3 => [-1, -1]}

# Set directions for letterbox grid - if required,
if height == 3
  directions = {0 => [0, 1], 1 => [0, 1], 2 => [0, -1], 3 => [0, -1]}
end
if width == 3
  bounces_limit -= 1
  directions = {0 => [1, 0], 1 => [1, 0], 2 => [-1, 0], 3 => [-1, 0]}
end

# Form grid.
grid = Array.new(height) { Array.new(width, "#") }
(1...(height - 1)).each do |index|
  grid[index] = ["#"] + [" "] * (width - 2) + ["#"]
end
grid[ row_index ][ column_index ] = "1"

# Continue until all bounces are completed.
while bounces_limit > 0
  # Get next move
  move_y, move_x = directions[direction_index]
  move_y += row_index
  move_x += column_index
  # If invalid, find a valid move.
  if move_y == 0 || move_y == height - 1 || move_x == 0 || move_x == width - 1
    while move_y == 0 || move_y == height - 1 || move_x == 0 || move_x == width - 1
      if move_y == 0 
        direction_index = direction_index == 1 ? 0 : 2
      elsif move_y == height - 1
        direction_index = direction_index == 0 ? 1 : 3
      elsif move_x == 0 
        direction_index = direction_index == 2 ? 0 : 1
      elsif move_x == width - 1
        direction_index = direction_index == 0 ? 2 : 3
      end
      move_y, move_x = directions[direction_index]
      move_y += row_index
      move_x += column_index
    end
    bounces_limit -= 1
  else
    # Add 1 to visited location.
    if height == 3 || width == 3
      bounces_limit -= 1
    end
    row_index = move_y
    column_index = move_x
    if grid[row_index][column_index] == " " 
      grid[row_index][column_index] = "1" 
    else
      grid[row_index][column_index] = (grid[row_index][column_index].to_i + 1).to_s 
    end
  end
end

# Print Grid.
grid.each do |row|
  puts row.join
end
