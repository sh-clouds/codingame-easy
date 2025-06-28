def distance(point_a, point_b)
  Math.sqrt((point_a[0] - point_b[0])**2 + (point_a[1] - point_b[1])**2)
end

total_distance = 0
minimum_distance = 9999
closest_city_index = -1
cities = [] 

number_of_cities = gets.to_i
number_of_cities.times do
  cities << gets.split.map(&:to_i)
end

start_city = finish_city = cities[0]
closest_city_index = -1
cities.shift

while cities.length > 0
  minimum_distance = 9999
  cities.each_with_index do |city, index|
    if distance(start_city, city) < minimum_distance
      minimum_distance = distance(start_city, city)
      closest_city_index = index
    end
  end
  total_distance += minimum_distance
  start_city = cities[closest_city_index]
  cities.delete_at(closest_city_index)
end

puts (total_distance + distance(start_city, finish_city)).round
