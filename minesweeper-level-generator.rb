def random(seed)
  ((214013 * seed + 2531011) & 0xffffffff) >> 16
end

n_list = gets.chomp.split(" ").map(&:to_i)

result = n_list[5]
yx_list = []
while n_list[2] > yx_list.length
  result = random(result)
  x_coordinate = result % n_list[0]
  result = random(result)
  y_coordinate = result % n_list[1]
  if !yx_list.include?([y_coordinate, x_coordinate]) && ( (n_list[4] - y_coordinate).abs > 1 || (n_list[3] - x_coordinate).abs > 1 )
    yx_list << [y_coordinate, x_coordinate]
  end
end

m_list = []
(0...n_list[1]).each do |y|
  x_list = []
  (0...n_list[0]).each do |x|
    if yx_list.include?([y, x])
      x_list << "#"
    else
      x_list << "."
    end
  end
  m_list << x_list
end

yx_list.each do |coordinates|
  y_coordinate, x_coordinate = coordinates
  [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, -1], [-1, 1], [1, -1]].each do |offset|
    y_neighbor = y_coordinate + offset[0]
    x_neighbor = x_coordinate + offset[1]
    if (0 <= y_neighbor && y_neighbor < n_list[1]) && (0 <= x_neighbor && x_neighbor < n_list[0])
      if m_list[y_neighbor][x_neighbor] == "."
        m_list[y_neighbor][x_neighbor] = 1
      elsif [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(m_list[y_neighbor][x_neighbor])
        m_list[y_neighbor][x_neighbor] += 1
      end
    end
  end
end

(0...n_list[1]).each do |y|
  result_string = ""
  (0...n_list[0]).each do |x|
    result_string += m_list[y][x].to_s
  end
  puts result_string
end