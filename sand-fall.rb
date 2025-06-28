width, height = gets.strip.split.map(&:to_i)
num_entries = gets.strip.to_i

grid = Array.new(height) { Array.new(width, ' ') }

num_entries.times do
  string_value, position = gets.strip.split
  position = position.to_i
  row = -1
  is_right_first = string_value.downcase == string_value

  loop do
    if row + 1 < height && grid[row + 1][position] == ' '
      row += 1
      next
    end

    if is_right_first
      if row + 1 < height && position + 1 < width && grid[row + 1][position + 1] == ' '
        row += 1
        position += 1
        next
      end
      if row + 1 < height && position - 1 >= 0 && grid[row + 1][position - 1] == ' '
        row += 1
        position -= 1
        next
      end
    else
      if row + 1 < height && position - 1 >= 0 && grid[row + 1][position - 1] == ' '
        row += 1
        position -= 1
        next
      end
      if row + 1 < height && position + 1 < width && grid[row + 1][position + 1] == ' '
        row += 1
        position += 1
        next
      end
    end

    grid[row][position] = string_value
    break
  end
end

grid.each do |row|
  puts '|' + row.join + '|'
end
puts '+' + '-' * width + '+'