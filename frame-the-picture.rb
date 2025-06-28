# Get the border design and width and height of the picture to be framed.
border_design = gets.chomp
height, width = gets.chomp.split.map(&:to_i)

# Print top border of the frame
(1..border_design.length).each do |i|
  puts border_design[0...i] + border_design[i - 1] * (width + 2 + (border_design.length - i) * 2) + border_design[0...i].reverse
end
puts border_design + " " * (width + 2) + border_design.reverse

# Print picture with border.
height.times do
  picture_line = gets.chomp  # the ASCII art picture line by line
  puts border_design + " " + picture_line + " " + border_design.reverse
end

# Print the bottom of the frame.
puts border_design + " " * (width + 2) + border_design.reverse
(border_design.length).downto(1) do |i|
  puts border_design[0...i] + border_design[i - 1] * (width + 2 + (border_design.length - i) * 2) + border_design[0...i].reverse
end
