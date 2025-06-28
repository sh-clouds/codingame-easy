
def subtract_pairs(pair1, pair2)
  [pair1[0] - pair2[0], pair1[1] - pair2[1]]
end


width, height, time1, time2, time3 = gets.split.map(&:to_i)
dictionary1 = {}
dictionary2 = {}

# Parse input into dictionaries
height.times do |i|
  string1, string2 = gets.split

  width.times do |j|
    if string1[j] != '.'
      dictionary1[string1[j]] = [i, j]
    end
    if string2[j] != '.'
      dictionary2[string2[j]] = [i, j]
    end
  end
end

# Extrapolate
output = Array.new(height) { '.' * width }
delta_time1 = time2 - time1
delta_time2 = time3 - time2

dictionary1.each do |alt, position1|
  position2 = dictionary2[alt]
  delta_position = subtract_pairs(position2, position1)
  
  new_position = [
    position2[0] + (delta_position[0] * (delta_time2.to_f / delta_time1)).floor,
    position2[1] + (delta_position[1] * (delta_time2.to_f / delta_time1)).floor
  ]

  next if new_position[0] < 0 || new_position[0] >= height || new_position[1] < 0 || new_position[1] >= width

  if output[new_position[0]][new_position[1]] == '.' || output[new_position[0]][new_position[1]] > alt
    output[new_position[0]][new_position[1]] = alt
  end
end

# Output
output.each { |line| puts line }
