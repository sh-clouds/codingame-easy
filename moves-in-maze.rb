class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

DIRECTIONS = [Point.new(0, 1), Point.new(0, -1), Point.new(1, 0), Point.new(-1, 0)]

def depth_to_char(depth)
  if depth < 10
    (depth + '0'.ord).chr
  else
    (depth - 10 + 'A'.ord).chr
  end
end

def bfs(start_x, start_y, map)
  queue = []
  temp_queue = []
  queue.push(Point.new(start_x, start_y))
  depth = 0

  until queue.empty?
    current_point = queue.shift

    if map[current_point.y][current_point.x] == '.'
      map[current_point.y][current_point.x] = depth_to_char(depth)

      DIRECTIONS.each do |direction|
        x = current_point.x + direction.x
        y = current_point.y + direction.y

        x = x < 0 ? $width - 1 : (x >= $width ? 0 : x)
        y = y < 0 ? $height - 1 : (y >= $height ? 0 : y)

        temp_queue.push(Point.new(x, y))
      end
    end

    if queue.empty?
      depth += 1
      queue = temp_queue
      temp_queue = []
    end
  end
end

$width, $height = gets.split.map(&:to_i)
map = Array.new($height) { Array.new($width) }
start_point = nil

(0...$height).each do |i|
  row = gets.chomp
  (0...$width).each do |j|
    map[i][j] = row[j]
    if row[j] == 'S'
      start_point = Point.new(j, i)
      map[i][j] = '.'
    end
  end
end

bfs(start_point.x, start_point.y, map)

(0...$height).each do |i|
  (0...$width).each do |j|
    print map[i][j]
  end
  puts
end
