def calc_legs_pos(nl, line, l, w)
  (0...nl).each do |j|
    if l[j] > 0
      if line[l[j] - 1] == '-'
        l[j] -= 3
      elsif l[j] < w - 1
        if line[l[j] + 1] == '-'
          l[j] += 3
        end
      end
    else
      if line[l[j] + 1] == '-'
        l[j] += 3
      end
    end
  end
end

w, h = gets.split.map(&:to_i)
top = [] #top
bottom = [] #bot
legs = [] #legs
nl = 0 #nlegs
matrix = []
top = gets.chomp
matrix = Array.new(h - 2) { gets.chomp }
bottom = gets.chomp
nl = (w / 3).to_i + 1
legs = (0...nl).map { |i| i * 3 } #init legs' positions

(0...(h - 2)).each do |i|
  line = matrix[i]
  calc_legs_pos(nl, line, legs, w)
end

(0...nl).each do |i|
  puts "#{top[i * 3]}#{bottom[legs[i]]}"
end