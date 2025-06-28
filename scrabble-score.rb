def read_string
  gets.chomp
end

def read_int
  read_string.to_i
end

class Coord
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class GameState
  attr_accessor :width, :height, :cells, :previous, :played, :points, :words

  def initialize(width, height, cells, previous, played, points)
    @width = width
    @height = height
    @cells = cells
    @previous = previous
    @played = played
    @points = points
    @words = {}
  end

  def get_value_l(x, y)
    if @previous[y][x] == '.'
      case @cells[y][x]
      when 'l'
        2
      when 'L'
        3
      else
        1
      end
    else
      1
    end
  end

  def get_value_w(x, y)
    if @previous[y][x] == '.'
      case @cells[y][x]
      when 'w'
        2
      when 'W'
        3
      else
        1
      end
    else
      1
    end
  end

  def compute_h(coord)
    x_min = coord.x
    x_max = coord.x
    y = coord.y
    k = 1
    score = 0

    while x_min > 0 && @played[y][x_min - 1] != '.'
      x_min -= 1
    end
    while x_max < @width - 1 && @played[y][x_max + 1] != '.'
      x_max += 1
    end

    if x_min != x_max
      word = ""
      (x_min..x_max).each do |x|
        ch = @played[y][x]
        word += ch
        score += get_value_l(x, y) * (@points[ch] || 0)
        k *= get_value_w(x, y)
      end
      @words[word] = (k * score)
    end
  end

  def compute_v(coord)
    y_min = coord.y
    y_max = coord.y
    x = coord.x
    k = 1
    score = 0

    while y_min > 0 && @played[y_min - 1][x] != '.'
      y_min -= 1
    end
    while y_max < @height - 1 && @played[y_max + 1][x] != '.'
      y_max += 1
    end

    if y_min != y_max
      word = ""
      (y_min..y_max).each do |y|
        ch = @played[y][x]
        word += ch
        score += get_value_l(x, y) * (@points[ch] || 0)
        k *= get_value_w(x, y)
      end
      @words[word] = (k * score)
    end
  end
end

# Main execution
points = {}
read_int.times do
  input_line = read_string
  inputs = input_line.split(" ")
  points[inputs[0][0]] = inputs[1].to_i
end

input_line = read_string
dims = input_line.split(" ")
width = dims[0].to_i
height = dims[1].to_i

cells = []
previous = []
played = []

height.times do
  cells << read_string
end
height.times do
  previous << read_string
end
height.times do
  played << read_string
end

tiles = []
height.times do |y|
  width.times do |x|
    if previous[y][x] != played[y][x]
      tiles << Coord.new(x, y)
    end
  end
end

game = GameState.new(width, height, cells, previous, played, points)

if tiles.length == 1
  game.compute_h(tiles[0])
  game.compute_v(tiles[0])
elsif tiles[0].y == tiles[1].y
  game.compute_h(tiles[0])
  tiles.each { |c| game.compute_v(c) }
else
  game.compute_v(tiles[0])
  tiles.each { |c| game.compute_h(c) }
end

score = 0
game.words.sort.each do |word, points|
  score += points
  puts "#{word} #{points}"
end

if tiles.length == 7
  score += 50
  puts "Bonus 50"
end

puts "Total #{score}"