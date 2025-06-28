player = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k"]
speeds = []
bends = []
minimum_speeds = []
rankings = []

n = gets.to_i
v = gets.to_i

n.times do
  speed = gets.to_i
  speeds << speed
end

v.times do
  bend = gets.to_i
  bends << bend
end

bends.each do |r|
  (0..55).each do |a|
    v = 55 - a
    if 90 - (Math.atan((v**2) / (r * 9.81))) / Math::PI * 180 > 30
      minimum_speeds << v
      break
    end
  end
end

minimum_speeds.sort!
puts minimum_speeds[0]

place = 0
speeds.each do |e|
  nb = 0
  chute = 0
  bends.each do |r|
    nb += 1
    if 90 - (Math.atan((e**2) / (r * 9.81))) / Math::PI * 180 <= 30
      rankings << [nb, e, player[place]]
      chute = 1
      break
    end
  end
  if chute == 1
    chute = 0
  else
    rankings << [999, e, player[place]]
  end
  place += 1
end

rankings.sort! { |a, b| b <=> a }
puts "y"
rankings.each do |e|
  x, y, z = e
  puts z
end
