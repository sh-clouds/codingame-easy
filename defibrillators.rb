def to_float(nb)
  nb.gsub(',', '.').to_f
end

longitude = to_float(gets.chomp)
latitude = to_float(gets.chomp)
num_defibs = gets.chomp.to_i
minimum_distance = Float::INFINITY
closest_defib = ""

num_defibs.times do
  defibrillator = gets.chomp
  temp = defibrillator.split(';')
  x = (longitude - to_float(temp[4])) * Math.cos((to_float(temp[5]) + latitude) / 2)
  y = latitude - to_float(temp[5])
  distance = Math.sqrt(x ** 2 + y ** 2) * 6372

  if distance < minimum_distance
    minimum_distance = distance
    closest_defib = temp[1]
  end
end

puts closest_defib