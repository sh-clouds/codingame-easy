def calculD(lon1, lat1, lon2, lat2)
  converted_lon1 = convertToRadian(lon1, "W")
  converted_lat1 = convertToRadian(lat1, "N")
  converted_lon2 = convertToRadian(lon2, "W")
  converted_lat2 = convertToRadian(lat2, "N")
  d = 2 * 6371 * Math.asin(Math.sqrt((Math.sin((converted_lat1 - converted_lat2) / 2)**2) + 
    Math.cos(converted_lat2) * Math.cos(converted_lat1) * 
    (Math.sin((converted_lon1 - converted_lon2) / 2)**2)))
  return d
end

def convertToRadian(a, sign)
  c = rounddig(a[:dd].to_i + a[:mm].to_i / 60.0 + a[:ss].to_i / 3600.0) #Convert to decimal degrees
  c = a[:sign] == sign ? -c.abs : c.abs #Change the sign
  c = (c * Math::PI) / 180 #Convert to Radians
  return c
end

def rounddig(i)
  (i * 10**5).round / 10**5.0
end

n = gets.to_i # number of capitals
m = gets.to_i # number of geolocations for which to find the closest capital
capitals_array = []
n.times do
  capital_name_geolocation = gets.chomp
  cng = capital_name_geolocation.split(" ")
  capitals_array.push({
    name: cng[0],
    lat: {
      sign: cng[1][0],
      dd: cng[1][1, 2],
      mm: cng[1][3, 2],
      ss: cng[1][5..-1],
      to_s: cng[1],
    },
    lon: {
      sign: cng[2][0],
      dd: cng[2][1, 3],
      mm: cng[2][4, 2],
      ss: cng[2][6..-1],
      to_s: cng[2],
    },
    text: "",
  })
end

n.times do |i|
  message = gets.chomp
  capitals_array[i][:text] = message
end

m.times do
  travel_geolocation = gets.chomp.split(" ")
  lat = {
    sign: travel_geolocation[0][0],
    dd: travel_geolocation[0][1, 2],
    mm: travel_geolocation[0][3, 2],
    ss: travel_geolocation[0][5..-1],
  }
  lon = {
    sign: travel_geolocation[1][0],
    dd: travel_geolocation[1][1, 3],
    mm: travel_geolocation[1][4, 2],
    ss: travel_geolocation[1][6..-1],
  }
  distance_min = [Float::INFINITY, [-1]]
  n.times do |a|
    distance = (calculD(capitals_array[a][:lon], capitals_array[a][:lat], lon, lat)).round
    STDERR.puts "#{distance} travelGeoloc: #{travel_geolocation} lon: #{capitals_array[a][:lon][:to_s]} lat: #{capitals_array[a][:lat][:to_s]}"
    if distance < distance_min[0]
      distance_min[0] = distance
      distance_min[1] = [a]
    elsif distance == distance_min[0]
      distance_min[1] << a
    end
  end
  answer = ""
  distance_min[1].each_with_index do |index, a|
    answer += capitals_array[index][:text]
    answer += " " if a != distance_min[1].length - 1
  end
  puts answer
end

