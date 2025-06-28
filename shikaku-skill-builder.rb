# Read width and height from standard input
width, height = gets.split.map(&:to_i)
grid = []

# Read grid from standard input
height.times do
  grid << gets.strip.split
end

(0...height).each do |y|
  (0...width).each do |x|
    value = grid[y][x].to_i

    if value != 0
      solutions = []

      (1..[value, height].min).reverse_each do |hr|
        next if value % hr != 0 # We can't make a rectangle with that height value

        wr = value / hr

        # Check with all the starting positions for the rectangle
        ([(y - hr + 1), 0].max..[y, height - hr].min).each do |yr|
          ([(x - wr + 1), 0].max..[x, width - wr].min).each do |xr|
            valid = true
            
            (yr...(yr + hr)).each do |yi|
              (xr...(xr + wr)).each do |xi|
                # The rectangle is covering another number => invalid
                if grid[yi][xi] != "0" && !(x == xi && y == yi)
                  valid = false
                  break
                end
              end
              break unless valid
            end

            solutions << [yr, xr, wr, hr] if valid
          end
        end
      end

      if solutions.any?
        puts "#{y} #{x} #{value}"

        # These lines must be sorted by r, then c and then width.
        solutions.sort_by! { |solution| [solution[0], solution[1], solution[2]] }

        puts solutions.map { |line| line.join(" ") }.join("\n")
      end
    end
  end
end