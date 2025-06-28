# Form grid, get starting location and direction.
width, height = gets.chomp.split.map(&:to_i)
grid = []
start_square = [-1, -1]
chars = {"<" => 0, "^" => 1, ">" => 2, "v" => 3, "#" => 0}
direction = 0
height.times do |i|
    grid << []
    input_line = gets.chomp
    input_line.each_char.with_index do |char, j|
        grid[-1] << (chars.include?(char) ? char : 0)
        if chars.include?(char) && char != "#"
            start_square = [i, j]
            direction = chars[char]
            grid[i][j] = 0
        end
    end
end

# Get which wall to follow and convert to value to be used.
# Value of side determines turn direction.
# -1 means left turn, 1 means right turn.
side = gets.chomp == "L" ? 1 : -1

# Set directions-L        U        R       D
directions = {0 => [0, -1], 1 => [-1, 0], 2 => [0, 1], 3 => [1, 0]}

# Required variables: previous square, i, j.
# Previous square used to check when Pika reaches the start again.
# I, J are the y, x coordinates of Pika.
previous_square = [-1, -1]
i = start_square[0]
j = start_square[1]
while previous_square != start_square do

    # Check for next valid move and turn until loop completed or valid move available.
    start_direction = direction
    loop_counter = 0
    while loop_counter < 4 do
        y, x = directions[direction]
        if i + y < 0 || i + y >= grid.length || j + x < 0 || j + x >= grid[0].length || grid[i + y][j + x] == "#"
            direction = (direction + side) % 4
        else
            break  
        end
        loop_counter += 1
    end
    # If Pika couldn't find a move in any direction, he is blocked, therefore end.
    break if loop_counter == 4

    # Move in the current direction. Alter direction to be the previous direction.
    # This will ensure that Pika 'hugs' the wall.
    i += y
    j += x
    grid[i][j] += 1 
    previous_square = [i, j]
    direction = (direction + (side * -1)) % 4
end

# Output the new grid which number of times each square was visited.
grid.each do |row|
    puts row.join
end