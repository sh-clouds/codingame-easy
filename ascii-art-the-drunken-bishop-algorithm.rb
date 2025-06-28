class Direction
  NORTH_WEST = 0
  NORTH_EAST = 1
  SOUTH_WEST = 2
  SOUTH_EAST = 3

  def self.from(val)
    case val
    when 0 then NORTH_WEST
    when 1 then NORTH_EAST
    when 2 then SOUTH_WEST
    else SOUTH_EAST
    end
  end

  def self.offset(direction)
    case direction
    when NORTH_WEST then [-1, -1]
    when NORTH_EAST then [-1, 1]
    when SOUTH_WEST then [1, -1]
    else [1, 1]
    end
  end
end

ROWS = 9
COLS = 17
SYMBOLS = [' ', '.', 'o', '+', '=', '*', 'B', 'O', 'X', '@', '%', '&', '#', '/', '^']

def pos_update(from, dir)
  dx, dy = Direction.offset(dir)
  from[0] = [[from[0] + dx, 0].max, ROWS - 1].min
  from[1] = [[from[1] + dy, 0].max, COLS - 1].min
end

grid = Array.new(ROWS) { Array.new(COLS, 0) }
pos = [4, 8]

gets.chomp.split(':').each do |byte_str|
    byte = byte_str.to_i(16)
    4.times do |i|
        bits = (byte >> (i * 2)) & 0b11
        pos_update(pos, Direction.from(bits))
        grid[pos[0]][pos[1]] += 1
    end
end

puts "+---[CODINGAME]---+"
grid.each_with_index do |row, i|
    print "|"
    row.each_with_index do |cell, j|
        if [i, j] == pos
            print "E"
        elsif [i, j] == [4, 8]
            print "S"
        else
            print SYMBOLS[cell % 15]
        end
    end
    puts "|"
end
puts "+-----------------+"

