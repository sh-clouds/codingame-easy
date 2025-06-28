road_length = gets.to_i  # The total kilometers of the route.
normal_speed = (road_length / 130.0) * 60
reduced_speed = 0

zone_quantity = gets.to_i  # The number of road construction sites.
zones = []

0.upto(zone_quantity-1) do |i|
  zone_km, zone_speed = gets.split.map(&:to_i)
  zones << [zone_km, zone_speed]
  # Calculate the time up to the start of this zone
  reduced_speed += (zone_km.to_f - (i > 0 ? zones[i - 1][0] : 0)) / (i > 0 ? zones[i - 1][1] : 130.0)
  # Last zone, it will last until the end of the road
  if i == zone_quantity - 1
    reduced_speed += (road_length.to_f - zone_km) / zone_speed
  end
end

puts (reduced_speed * 60 - normal_speed).round