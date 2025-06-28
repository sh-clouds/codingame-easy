def empty(grid, x, y)
  grid[y][x] == "."
end

def is_O(grid, x, y)
  grid[y][x] == "O"
end

def is_win(board)
  (0..2).each do |x|
    ctest = true
    (0..2).each do |y|
      ctest &&= is_O(board, x, y)
    end
    return true if ctest
  end

  (0..2).each do |y|
    ctest = true
    (0..2).each do |x|
      ctest &&= is_O(board, x, y)
    end
    return true if ctest
  end

  ctest = true
  [[0, 0], [1, 1], [2, 2]].each do |(x, y)|
    ctest &&= is_O(board, x, y)
  end
  return true if ctest

  ctest = true
  [[2, 0], [1, 1], [0, 2]].each do |(x, y)|
    ctest &&= is_O(board, x, y)
  end
  return ctest
end

def show(board)
  puts board.join("\n")
end

def cpy_with_move(grid, x, y)
  grid_clone = grid.map(&:dup)
  row_clone = grid_clone[y].chars
  row_clone[x] = "O"
  grid_clone[y] = row_clone.join
  grid_clone
end

################### MAIN #######################
grid = []
3.times do
  grid << gets.chomp
end

(0..2).each do |x|
  (0..2).each do |y|
    if empty(grid, x, y)
      grid_clone = cpy_with_move(grid, x, y)
      if is_win(grid_clone)
        show(grid_clone)
        exit
      end
    end
  end
end
puts "false"