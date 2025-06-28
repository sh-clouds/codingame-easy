size = gets.to_i
thickness = gets.to_i
n = gets.to_i

lines = Array.new(n) { gets.chomp }
length = lines.map(&:length).max
grid = Array.new(size * n) { Array.new(length * size, ' ') }
left = (size - thickness) / 2
right = left + thickness - 1

def check(u, v, size, left, right)
  if left < v && v < right
    u == 0 || u == size - 1
  else
    u == left || u == right
  end
end

def draw(x, y, size, left, right, grid)
  x *= size
  y *= size
  (0...size).each do |dy|
    (0...size).each do |dx|
      if check(dx, dy, size, left, right) || check(dy, dx, size, left, right)
        if x > dx && dx == 0 && left < dy && dy < right && grid[y + dy][x - 1] == '+'
          grid[y + dy][x - 1] = ' '
        elsif y > dy && dy == 0 && left < dx && dx < right && grid[y - 1][x + dx] == '+'
          grid[y - 1][x + dx] = ' '
        else
          grid[y + dy][x + dx] = '+'
        end
      end
    end
  end
end

lines.each_with_index do |row, y|
  row.chars.each_with_index do |c, x|
    draw(x, y, size, left, right, grid) if c == '+'
  end
end

grid.each do |row|
  puts row.join.rstrip
end