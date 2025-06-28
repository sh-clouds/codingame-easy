require "set"

# Set grid to 2D array.
grid = []
n = gets.to_i
n.times do
  row = gets.chomp
  grid << row.chars
end

def search(grid, row_index, column_index, checked, islands)
  """
  This is a helper function to recursively search the grid to find coast lengths.

  Parameters:
  grid: 2D Array - Grid to be searched
  row_index: int - Index of row of grid.
  column_index: int - Index of column of grid.

  Return: None
  """
  # Check the item to check is valid.
  return 0 if row_index < 0 || row_index > grid.length - 1 || column_index < 0 || column_index > grid[0].length - 1

  # If water has been found - Add 1 to coast length if it hasn't been added already.
  if grid[row_index][column_index] == "~"
    unless checked.include?([row_index, column_index])
      islands[-1] += 1
    end
    checked.add([row_index, column_index])
  
  # If part of island found then recursively search.
  # Set current position to ? to stop endless loop.
  elsif grid[row_index][column_index] == "#"
    grid[row_index][column_index] = "?"
    # Up
    search(grid, row_index - 1, column_index, checked, islands)
    # Down
    search(grid, row_index + 1, column_index, checked, islands)
    # Left
    search(grid, row_index, column_index - 1, checked, islands)
    # Right
    search(grid, row_index, column_index + 1, checked, islands)
  end
end

# Check for islands and find the coast length.
islands = []
grid.each_with_index do |row, row_index|
  row.each_with_index do |cell, column_index|
    if cell == "#"
      islands << 0
      checked = Set.new
      search(grid, row_index, column_index, checked, islands)
    end
  end
end

# Output the island index and the coast value for the island with the longest coast.
max_value = 0
max_index = 0
islands.each_with_index do |value, index|
  if value > max_value
    max_value = value
    max_index = index
  end
end
puts "#{max_index + 1} #{max_value}"
