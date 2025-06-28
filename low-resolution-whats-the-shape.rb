shape = ""

width, height = gets.chomp.split.map(&:to_i)
height.times do
  # Replace all the "grey" characters with the same symbol
  shape += gets.chomp.gsub(/[^\.X]/, "*").strip
end

# Rectangle is just full X
if shape.count("X") == width * height
  puts "Rectangle"
# Ellipse all the corners are the same
elsif shape[0] == shape[width - 1] && shape[0] == shape[width * height - width] && shape[0] == shape[width * height - 1]
  puts "Ellipse"
# All the rest is a triangle
else
  puts "Triangle"
end
