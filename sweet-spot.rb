def b_bomb(line_list, x, y, b_list)
  b_list.each do |b|
    x, y = b[0], b[1]
    (-3..3).each do |y1|
      if y1 + y >= 0 && y1 + y < line_list.length
        line = line_list[y1 + y]
        diff = 4 - y1.abs
        if !['A', 'H', 'B'].include?(line[x])
          if diff > line[x].to_i
            line[x] = diff.to_s
            line_list[y1 + y] = line
          end
        end
        if line[x] == "B"
          b_list << [x, y1 + y] unless b_list.include?([x, y1 + y])
        end
      end
    end
    line = line_list[y]
    (-3..3).each do |x1|
      if x1 + x >= 0 && x1 + x < line_list.length
        diff = 4 - x1.abs
        if !['A', 'H', 'B'].include?(line[x1 + x])
          if diff > line[x1 + x].to_i
            line[x1 + x] = diff.to_s
            line_list[y] = line
          end
        end
        if line[x1 + x] == "B"
          b_list << [x1 + x, y] unless b_list.include?([x1 + x, y])
        end
      end
    end
  end
  line_list
end

def a_bomb(line_list, x, y, b_list)
  (-3..3).each do |y1|
    if y1 + y >= 0 && y1 + y < line_list.length
      line = line_list[y1 + y]
      (-3..3).each do |x1|
        if x1 + x >= 0 && x1 + x < line_list.length
          diff = 4
          if x1.abs > y1.abs
            diff -= x1.abs
          else
            diff -= y1.abs
          end

          if !['A', 'H', 'B'].include?(line[x1 + x])
            if diff > line[x1 + x].to_i
              line[x1 + x] = diff.to_s
              line_list[y1 + y] = line
            end
          end
          if line[x1 + x] == "B"
            b_list << [x1 + x, y1 + y]
          end
        end
      end
    end
  end
  [line_list, b_list]
end

def h_bomb(line_list, x, y, b_list)
  (-3..3).each do |y1|
    if y1 + y >= 0 && y1 + y < line_list.length
      line = line_list[y1 + y]
      (-3..3).each do |x1|
        if x1 + x >= 0 && x1 + x < line_list.length
          diff = 5
          if !['A', 'H', 'B'].include?(line[x1 + x])
            if diff > line[x1 + x].to_i
              line[x1 + x] = diff.to_s
              line_list[y1 + y] = line
            end
          end
          if line[x1 + x] == "B"
            b_list << [x1 + x, y1 + y]
          end
        end
      end
    end
  end
  [line_list, b_list]
end

n = gets.to_i
line_list = []
n.times do
  line = gets.chomp.chars
  line_list << line
end

b_list = []

line_list.each_with_index do |line, y|
  line.each_with_index do |b, x|
    if b == "A"
      line_list, b_list = a_bomb(line_list, x, y, b_list)
    elsif b == "H"
      line_list, b_list = h_bomb(line_list, x, y, b_list)
    end
  end
end

$stderr.puts b_list.inspect
b_bomb(line_list, 0, 0, b_list)

line_list.each do |line|
  erg = line.join
  puts erg
end