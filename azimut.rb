dirs = ["N", "NE", "E", "SE", "S", "SW", "W", "NW"]
start_direction = gets.chomp
idx = dirs.index(start_direction) || (raise "Invalid direction")

gets.chomp.to_i.times do
  case gets.chomp
  when "RIGHT"
    idx += 1
  when "LEFT"
    idx += 7
  when "BACK"
    idx += 4
  end
end

puts dirs[idx % 8]