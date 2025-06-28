def search(pattern, grid)
  dirs = [
    [0, 1], [1, 0], [0, -1], [-1, 0], [1, 1], [-1, -1], [1, -1], [-1, 1]
  ]

  result = []

  pattern_chars = pattern.chars
  first_char = pattern_chars[0]
  size = grid.size

  (0...size).each do |x|
    (0...size).each do |y|
      next if grid[x][y] != first_char

      dirs.each do |dx, dy|
        result.push([x, y])
        cur_x, cur_y = x, y

        (1...pattern_chars.length).each do |k|
          cur_x += dx
          cur_y += dy

          if cur_x < 0 || cur_x >= size || cur_y < 0 || cur_y >= size
            result.clear
            break
          end

          if grid[cur_x][cur_y] != pattern_chars[k]
            result.clear
            break
          end
          result.push([cur_x, cur_y])
        end

        return result unless result.empty?
      end
    end
  end

  result
end

size = gets.chomp.to_i
grid = Array.new(size) { [] }
states = Array.new(size) { Array.new(size, false) }

(0...size).each do |i|
  grid[i] = gets.chomp.chars
end

gets.chomp.split.map(&:upcase).each do |word|
  search(word, grid).each do |x, y|
    states[x][y] = true
  end
end

grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    print(states[i][j] ? cell : ' ')
  end
  puts ''
end
