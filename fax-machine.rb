# Get width, height and encoding values.
width = gets.to_i
height = gets.to_i
encoding_values = gets.split.map(&:to_i)

# Form Grid.
grid = Array.new(height) { Array.new(width, " ") }

# Declare required variables.
should_draw = true
index = 0
encoding_index = 0

# Use wrapping index and swapping flag with XOR to place * in correct places.
while index < height * width
  if should_draw
    encoding_values[encoding_index].times do
      grid[index / width][index % width] = "*"
      index += 1
    end
  else
    index += encoding_values[encoding_index]
  end
  encoding_index += 1
  should_draw ^= true
end

# Output the new grid.
grid.each do |row|
  puts "|" + row.join("") + "|"
end
