# Get dimensions and form grid.
height, width = gets.chomp.split.map(&:to_i)
grid = Array.new(height) { gets.chomp.split }

# Get values from the grid.
node_values = []
(0...height).each do |i|
  line = gets.chomp.split
  line.each_with_index do |character, j|
    if character == "X"
      node_values << grid[i][j].to_i
    end
  end
end

# Check pairing nodes are opposite signs.
is_valid = true
(0...node_values.length - 1).step(2) do |i|
  if (node_values[i] > 0 && node_values[i + 1] > 0) || (node_values[i] < 0 && node_values[i + 1] < 0)
    is_valid = false
  end
end

# Output if valid or not.
puts is_valid ? "true" : "false"