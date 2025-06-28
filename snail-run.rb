number_snails = gets.to_i
speeds = []
number_snails.times do
  speeds << gets.to_f
end
map_height = gets.to_i
map_width = gets.to_i
pos = Array.new(number_snails)
finishes = []
map_height.times do |y|
  row = gets.chomp
  row.each_char.with_index do |c,x|
    if c == '#'
      finishes << [x,y]
    elsif c != '*'
      pos[c.to_i-1] = [x,y]
    end
  end
end


puts (1..number_snails).min_by { |i|
  x1,y1 = pos[i-1]
  d = finishes.map{ |x2,y2| (x1-x2).abs + (y1-y2).abs}.min
  d/speeds[i-1]
}
