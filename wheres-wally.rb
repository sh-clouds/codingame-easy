# Get starting position of wally and coordinates of other wally characters relative to the first.
wally_width, wally_height = gets.split.map(&:to_i)
shape = []
start_position = [-1, -1]
start_character = ""
wally_height.times do |i|
  input_string = gets.chomp
  input_string.each_char.with_index do |character, j|
    if character != " "
      if start_position == [-1, -1]
        start_position = [i, j]
        start_character = character
      else
        shape << [[i - start_position[0], j - start_position[1]], character]
      end
    end
  end
end

# Form Grid.
_, picture_height = gets.split.map(&:to_i)
grid = Array.new(picture_height) { gets.chomp.chars }

# Find Wally.
grid.each_with_index do |row, i|
  row.each_with_index do |character, j|
    if character == start_character
      found_wally = true
      shape.each do |coords, wally_character|
        y, x = coords
        if i + y < 0 || i + y >= grid.length || j + x < 0 || j + x >= grid[0].length || grid[i + y][j + x] != wally_character
          found_wally = false
          break
        end
      end
      # Output and quit - Only one wally.
      if found_wally
        puts "#{j - start_position[1]} #{i - start_position[0]}"
        exit
      end
    end
  end
end