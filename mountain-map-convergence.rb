number_of_mountains = gets.to_i  # the number of mountains

last_position = [1, 0]
mountain_map = {}

altitude_inputs = gets.split + [nil]
altitude_inputs.each do |altitude|
    height = altitude.nil? ? 1 : altitude.to_i
    while height > last_position[0]
        mountain_map[last_position] = "/"
        last_position = [last_position[0] + 1, last_position[1] + 1]
    end
    while height < last_position[0]
        last_position = [last_position[0] - 1, last_position[1]]
        mountain_map[last_position] = "\\"
        last_position = [last_position[0], last_position[1] + 1]
    end
    unless altitude.nil?
        mountain_map[last_position] = "/"
        last_position = [last_position[0], last_position[1] + 1]
        mountain_map[last_position] = "\\"
        last_position = [last_position[0], last_position[1] + 1]
    end
end

height_min, height_max = mountain_map.keys.map(&:first).minmax
(height_max).downto(height_min) do |height|
    line_segments = mountain_map.select { |position| position[0] == height }.map { |position, value| [position[1], value] }
    max_width = line_segments.map(&:first).max
    line_output = Array.new(max_width + 1, " ")
    line_segments.each do |y, value|
        line_output[y] = value
    end
    puts line_output.join
end