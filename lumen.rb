number_of_cells = gets.to_i
length_of_candle = gets.to_i

cells = Array.new(number_of_cells * number_of_cells, 1)

(0...number_of_cells).each do |current_y|
  gets.strip.split(" ").each_with_index do |cell, current_x|
    if cell == "C" # We found a candle, unset all cells affected by this candle
      ( [0, current_y - length_of_candle + 1].max .. [number_of_cells, current_y + length_of_candle].min - 1 ).each do |y|
        ( [0, current_x - length_of_candle + 1].max .. [number_of_cells, current_x + length_of_candle].min - 1 ).each do |x|
          cells[(y * number_of_cells) + x] = nil
        end
      end
    end
  end
end

puts cells.compact.size
