STDOUT.sync = true # DO NOT REMOVE

# catch up and win

# $K: representing after how many turns the sus man will make another move
k = gets.to_i
s = []
px = py = nil

10.times do |y|
  line = gets.chomp

  # We need the starting position of our character
  if (p = line.index("P"))
    px = p
    py = y
  end

  s << line
end

# Debugging output
#puts map.inspect

# game loop
loop do
  ey, ex = gets.split.map(&:to_i)

  # We start the search from the enemy position
  positions = [[ex, ey, ""]]

  loop do
    possible_moves = []
    new_positions = []
    visited = Hash.new { |h, k| h[k] = {} }

    # Check all the positions we reached last step
    positions.each do |position|
      ex, ey, d = position

      # Already where there
      next if visited[ey][ex]

      # Reach our person, we continue until the end of this step to have all the possible moves with the same score
      if ex == px && ey == py
        possible_moves << d
        next
      end

      visited[ey][ex] = true

      # Check the cardinal directions
      [[0, -1, "D"], [-1, 0, "R"], [0, 1, "U"], [1, 0, "L"]].each do |move|
        ux = ex + move[0]
        uy = ey + move[1]

        next if ux < 0 || ux >= 10 || uy < 0 || uy >= 10 || s[uy][ux] == "*"
        new_positions << [ux, uy, move[2]]
      end
    end

    # We reached our person
    if possible_moves.any?
      # In case several directions have the same score, pick one randomly
      d = possible_moves.sample

      # Update person position for next turn
      case d
      when "U" then py -= 1
      when "D" then py += 1
      when "L" then px -= 1
      when "R" then px += 1
      end

      puts d
      break
    else
      # We haven't reached our person, continue the search
      positions = new_positions
    end
  end
end

