# Array for storing units and conversion numbers.
units = ["miles", "furlongs", "chains", "yards", "feet", "inches"]
time_units = ["fortnight", "week", "day", "hour", "minute", "second"]
distance_conversion_factors = [1, 8, 10, 22, 3, 12]
time_conversion_factors = [1, 2, 7, 24, 60, 60]

# Get input and parse to get relevant info.
input_speed = gets.chomp

left_part, right_part = input_speed.split(" CONVERT TO ")
value, units1, _, time1 = left_part.split
units2, _, time2 = right_part.split
value = value.to_f

# Get the index of the time units.
index1 = time_units.index(time1)
index2 = time_units.index(time2)

# Convert value to required units. 
while index2 > index1
  value /= time_conversion_factors[index1 + 1]
  index1 += 1
end

while index2 < index1
  value *= time_conversion_factors[index2 + 1]
  index2 += 1
end

# Get the index of the distance units.
index1 = units.index(units1)
index2 = units.index(units2)

# Convert value to required units.
while index2 > index1
  value *= distance_conversion_factors[index1 + 1]
  index1 += 1
end

while index2 < index1
  value /= distance_conversion_factors[index2 + 1]
  index2 += 1
end

# Print the converted value
puts "#{value.round(1)} #{units2} per #{time2}"