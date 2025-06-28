# NOTE: Coordinates are in the form Y,X.
w, h = gets.chomp.split.map(&:to_i)
n = gets.to_i
grid = []
barriers = {} # Barrier pos: [Next barrier pos, distance between]
pos = []

h.times do |i|
  grid << []
  gets.chomp.chars.each_with_index do |char, j|
    grid[-1] << char
    if char == "#"
      barriers[[i, j]] = nil
    elsif char == "O"
      pos = [i, j]
      grid[i][j] = "."
    end
  end
end

# Set up directions.
directions = {0 => [-1, 0], 1 => [0, 1], 2 => [1, 0], 3 => [0, -1]}
direction = 0

prev = nil
# Mapping the barriers together.
loop do
  # If next move is a barrier, map the barrier until a loop is found.
  if barriers.key?([pos[0] + directions[direction][0], pos[1] + directions[direction][1]])
    barrier_y = pos[0] + directions[direction][0]
    barrier_x = pos[1] + directions[direction][1]
    if prev.nil?
      prev = [barrier_y, barrier_x]
    else
      barriers[prev] = [[barrier_y, barrier_x], (barrier_y - prev[0]).abs + (barrier_x - prev[1]).abs - 2]
      prev = [barrier_y, barrier_x]
      break if barriers[prev]
    end
  end
  # Move to next position.
  while barriers.key?([pos[0] + directions[direction][0], pos[1] + directions[direction][1]])
    direction = (direction + 1) % 4
  end
  pos[0] += directions[direction][0]
  pos[1] += directions[direction][1]
  n -= 1
end

# Calculate length of loop.
loop_length = 0
start = prev
loop do
  prev, distance = barriers[prev]
  loop_length += distance
  break if prev == start
end

# Simulate the loops (Remainder of n / loop size).
n %= loop_length

# Move the remaining spaces.
while n > 0
  while barriers.key?([pos[0] + directions[direction][0], pos[1] + directions[direction][1]])
    direction = (direction + 1) % 4
  end
  pos[0] += directions[direction][0]
  pos[1] += directions[direction][1]
  n -= 1
end

# Output the final position of the robot.
puts "#{pos[1]} #{pos[0]}"

