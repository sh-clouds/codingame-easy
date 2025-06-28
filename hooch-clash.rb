def calc_vol(size)
  (4 * Math::PI * ((size / 2.0) ** 3)) / 3
end

def equal(volume1, volume2)
  volume1 - 0.001 <= volume2 && volume2 <= volume1 + 0.001
end

orb_size_min, orb_size_max = gets.split.map(&:to_i)
g1, g2 = gets.split.map(&:to_i)
vol_sum = calc_vol(g1) + calc_vol(g2)

particle1 = g1
particle2 = g2
volume_diff = calc_vol(g1) - calc_vol(g2)

(orb_size_min..orb_size_max).each do |i|
  volume1 = calc_vol(i)

  (i..orb_size_max).each do |u|
    volume2 = calc_vol(u)
    if equal(volume1 + volume2, vol_sum)
      if particle1 == g1 || calc_vol(u) - calc_vol(i) > volume_diff
        particle1 = i
        particle2 = u
        volume_diff = calc_vol(u) - calc_vol(i)
      end
      break
    end
    break if volume1 + volume2 > vol_sum
  end
end

if particle1 == g1
  puts 'VALID'
else
  print "#{particle1} #{particle2}"
end