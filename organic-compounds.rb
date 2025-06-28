input_data = $stdin.read.strip.split("\n")
number_of_lines = input_data[0].to_i
lines = input_data[1, number_of_lines].map(&:upcase)

(0...number_of_lines).each do |i|
  next unless lines[i].include?('C')

  (0...(lines[i].length - 2)).each do |j|
    if lines[i][j, 2] == "CH"
      b = lines[i][j + 2].to_i
      begin
        b += lines[i - 1][j + 1].to_i
      rescue
      end
      begin
        b += lines[i + 1][j + 1].to_i
      rescue
      end
      begin
        b += lines[i][j - 2].to_i
      rescue
      end
      begin
        b += lines[i][j + 4].to_i
      rescue
      end
      
      if b != 4
        puts "INVALID"
        exit
      end
      j += 5
    end
  end
end
puts "VALID"

