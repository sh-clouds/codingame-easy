def conv_at(image, kernel, position)
  result = 0

  kernel.each_with_index do |row, i|
    row.each_with_index do |value, j|
      result += image[i + position[:first]][j + position[:second]] * value
    end
  end

  result
end

rows, columns = gets.chomp.split.map(&:to_i)

image = Array.new(rows) { Array.new(columns, 0) }
rows.times do |i|

  inputs = gets.split
  for j in 0..(columns.-1)  
    image[i][j] = inputs[j].to_i
  end
end

kernel_rows, kernel_columns = gets.chomp.split.map(&:to_i)

kernel = Array.new(kernel_rows) { Array.new(kernel_columns, 0) }
kernel_rows.times do |i|

  inputs = gets.split
  for j in 0..(kernel_columns-1)
    kernel[i][j] = inputs[j].to_i
  end
end

result = Array.new(rows - kernel_rows) { Array.new(columns - kernel_columns, 0) }
(0..rows - kernel_rows).each do |i|
  output_string = ""
  (0..columns - kernel_columns).each do |j|
    output_string += "#{conv_at(image, kernel, {first: i, second: j})} "
  end
  output_string.rstrip!
  puts output_string
end
