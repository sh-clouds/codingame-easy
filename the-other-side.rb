require 'set'

# Get inputs.
$height = gets.to_i
$width = gets.to_i

# Form Grid.
$grid = Array.new($height) { gets.split }

# Function to check if there's a path from (i, j) to the rightmost column
def can_reach_end(row_index, column_index, visited)
  # If reached the rightmost column, return true
  return true if column_index == $width - 1 || $grid[row_index][column_index] == "P"
  
  # Mark the cell as visited
  original_value = $grid[row_index][column_index]
  $grid[row_index][column_index] = "P" # Set to P for easier searching of large grids.
  visited.add([row_index, column_index])

  # Explore the four possible directions (down, right, up, left)
  [[1, 0], [0, 1], [-1, 0], [0, -1]].each do |direction|
    new_row_index = row_index + direction[1]
    new_column_index = column_index + direction[0]

    # Check bounds and if the cell is traversable and not visited
    if new_row_index.between?(0, $height - 1) && new_column_index.between?(0, $width - 1) && !visited.include?([new_row_index, new_column_index])
      if $grid[new_row_index][new_column_index] == '+'
        return true if can_reach_end(new_row_index, new_column_index, visited)
      elsif $grid[new_row_index][new_column_index] == "P"
        return true
      end
    end
  end

  $grid[row_index][column_index] = original_value # Return to original if not found.
  false
end

# Count the number of cells in the left column that can reach the rightmost column
reachable_count = 0
(0...$height).each do |row_index|
  if $grid[row_index][0] == '+'
    reachable_count += 1 if can_reach_end(row_index, 0, Set.new)
  elsif $grid[row_index][0] == "P"
    reachable_count += 1
  end
end

# Output the count.
puts reachable_count
