# Get the input, form the grid and store the location of snake heads.
n, m = gets.split.map(&:to_i)
grid = []
snake_heads = []
n.times do |i|
    input_line = gets.chomp
    row = []
    input_line.chars.each_with_index do |char, j|
        if char == "o"
            snake_heads << [i, j]
        end
        row << char
    end
    grid << row
end

# Define the required variables.
largest_snake = [0, 0]
movement_directions = [[1, 0], [-1, 0], [0, -1], [0, 1]]
snake_tails = ["<", ">", "^", "v"]
snake_body = ["|", "-"]
current_direction = 0

# Find the length of the snake.
snake_heads.each do |i, j|
    snake_size = 2
    while !snake_tails.include?(grid[i][j])
        if grid[i][j] == "*"
            snake_size += 1
        end

        # Determine direction of snake.
        if i - 1 >= 0 && grid[i - 1][j] == "|"
            current_direction = 1
            i -= 1
        elsif i + 1 < grid.length && grid[i + 1][j] == "|"
            current_direction = 0
            i += 1
        elsif j - 1 >= 0 && grid[i][j - 1] == "-"
            current_direction = 2
            j -= 1
        else
            current_direction = 3
            j += 1
        end

        # Move until a blocker.
        while snake_body.include?(grid[i][j])
            grid[i][j] = "."
            i += movement_directions[current_direction][0]
            j += movement_directions[current_direction][1]
            snake_size += 1
        end
    end
    
    # Update the largest snake size and quantity.
    if snake_size > largest_snake[0]
        largest_snake = [snake_size, 1]
    elsif snake_size == largest_snake[0]
        largest_snake[1] += 1
    end
end

# Print the largest size and number of snakes with that size.
puts largest_snake.join("\n")