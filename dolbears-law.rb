# Get inputs.
total_time = 0
combined_values = []
input_value = gets.to_f

# Calculate N60
input_value.to_i.times do
  line = gets.split.map(&:to_f)
  seconds = line.length * 4
  total_time += (10 + (line.sum - 40) / 7)
  combined_values.concat(line)
end

# Print N60 average.
puts "%.1f" % (total_time / input_value)

# If 5<N60<30, print N8 average.
if total_time / input_value > 5 && total_time / input_value < 30
  total_n8 = 0
  index = 0
  while index < combined_values.length - 1
    total_n8 += combined_values[index] + combined_values[index + 1] + 5
    index += 2
  end
  puts "%.1f" % (total_n8 / (combined_values.length / 2))
end