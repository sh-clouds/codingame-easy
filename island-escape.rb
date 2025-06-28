require 'set'

def can_escape(grid_size, elevation_grid)
  # Start position is always at the center
  start_x = start_y = grid_size / 2  
  start_elevation = elevation_grid[start_x][start_y]
  
  # Directions: Up, Down, Left, Right
  directions = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  
  # BFS queue and visited set
  queue = [[start_x, start_y]]
  visited = Set.new(queue)

  while queue.any?
    x, y = queue.shift

    # Check if we're at the border with elevation 0
    if (x == 0 || y == 0 || x == grid_size - 1 || y == grid_size - 1) && elevation_grid[x][y] == 0
      return "yes"
    end

    # Explore all possible moves
    directions.each do |dx, dy|
      nx, ny = x + dx, y + dy

      # Check if within bounds
      if nx.between?(0, grid_size - 1) && ny.between?(0, grid_size - 1)
        # Check elevation difference constraint
        if (elevation_grid[nx][ny] - elevation_grid[x][y]).abs <= 1 && !visited.include?([nx, ny])
          queue.push([nx, ny])
          visited.add([nx, ny])
        end
      end
    end
  end

  return "no"
end

# Read input
grid_size = gets.to_i
elevation_grid = Array.new(grid_size) { gets.split.map(&:to_i) }

# Output result
puts can_escape(grid_size, elevation_grid)
