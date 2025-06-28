
def self.markway(grid, row_index, column_index, threshold)
    # Starting point to be returned as 0
    return 0 if grid[row_index][column_index].zero?

    # This is added to handle first row and first column
    if row_index.zero? || column_index.zero?
      # if cell value is <= threshold and it has 0 to left or on top, mark with 0
      return 0 if row_index.zero? && grid[row_index][column_index] <= threshold && grid[row_index][column_index - 1].zero?
      return 0 if column_index.zero? && grid[row_index][column_index] <= threshold && grid[row_index - 1][column_index].zero?
    # if current cell value is <= threshold and it has 0 to left or on top, mark with 0
    elsif grid[row_index][column_index] <= threshold && (grid[row_index - 1][column_index].zero? || grid[row_index][column_index - 1].zero?)
      return 0
    end
    -1
end

row_count = gets.to_i
column_count = gets.to_i
threshold = gets.to_i
zero_count = 0
grid = Array.new(row_count) { Array.new(column_count, 0) }

# This creates and fills 2D array. After each cell is filled it is checked with markway procedure
# and marked as 0 if it is a valid position and -1 if it is not.
(0...row_count).each do |row_index|
    (0...column_count).each do |column_index|
        grid[row_index][column_index] = row_index.to_s.chars.map(&:to_i).sum +
                                        column_index.to_s.chars.map(&:to_i).sum
        grid[row_index][column_index] = markway(grid, row_index, column_index, threshold)
    end
end

# Counts zeros and returns count as answer
grid.flatten.each do |cell_value|
    zero_count += 1 if cell_value == 0
end
puts zero_count