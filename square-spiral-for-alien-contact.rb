class Position
  attr_accessor :y, :x

  def initialize(y, x)
    @y = y
    @x = x
  end

  def add(pos)
    Position.new(pos.y + @y, pos.x + @x)
  end
end

def print_grid(grid)
  count = 0
  grid.each do |row|
    break if count >= 31
    line = row.join[0, 31]
    puts line
    count += 1
  end
end

def get_next_location(location, is_clockwise)
  locations = ["topLeft", "topRight", "bottomRight", "bottomLeft"]
  current_index = locations.index(location)
  direction_index = is_clockwise ? 1 : -1
  new_index = (locations.length + current_index + direction_index) % locations.length
  locations[new_index]
end

def get_start(location, size)
  case location
  when "topLeft"
    Position.new(0, 0)
  when "topRight"
    Position.new(0, size - 1)
  when "bottomRight"
    Position.new(size - 1, size - 1)
  when "bottomLeft"
    Position.new(size - 1, 0)
  end
end

def get_direction(location, is_clockwise)
  case location
  when "topLeft"
    is_clockwise ? Position.new(0, 1) : Position.new(1, 0)
  when "topRight"
    is_clockwise ? Position.new(1, 0) : Position.new(0, -1)
  when "bottomRight"
    is_clockwise ? Position.new(0, -1) : Position.new(-1, 0)
  when "bottomLeft"
    is_clockwise ? Position.new(-1, 0) : Position.new(0, 1)
  end
end

def get_letter(input)
  input[0]
end

def get_count(input)
  input[1..-1].to_i
end

def is_valid_symbol(symbol)
  ('A'..'Z').include?(symbol)
end

inputs = gets.chomp.split(" ")
size = inputs[0].to_i
location = inputs[1]
is_clockwise = inputs[2] == "clockwise"

current_letter = get_letter(inputs[3])
current_count = get_count(inputs[3])

next_letter = get_letter(inputs[4])
next_count = get_count(inputs[4])

letter_difference = next_letter.ord - current_letter.ord
count_difference = next_count - current_count

grid = Array.new(size) { Array.new(size, " ") }

current_position = get_start(location, size)
iterations = -1
step = size - 1
letter_count = current_count

while step > 0
  direction = get_direction(location, is_clockwise)
  step.times do
    grid[current_position.y][current_position.x] = current_letter
    letter_count -= 1
    current_position = current_position.add(direction)

    if letter_count <= 0
      current_count += count_difference
      letter_count = current_count
      current_letter = (current_letter.ord + letter_difference).chr
      unless is_valid_symbol(current_letter)
        step = -1
        break
      end
    end
  end

  location = get_next_location(location, is_clockwise)
  iterations += 1
  if iterations >= 2
    step -= 2
    iterations = 0
  end
end

if is_valid_symbol(current_letter)
  grid[current_position.y][current_position.x] = current_letter
end

print_grid(grid)