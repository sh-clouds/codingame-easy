number_of_lines = gets.to_i
pattern = gets.chomp

# Some lines don't start with the first character of the pattern create a string that will contain all the valid lines
control_string = pattern * ((number_of_lines.to_f / pattern.length).ceil + 1)

(0...number_of_lines).each do |line_index|
  line = gets.chomp

  # If the line is not found inside our control string it's the line with the error
  unless control_string.include?(line)

    # We know there's only one error, exclude character one by one until the line is found in the control string
    (1...number_of_lines).each do |character_index|
      # The last character excluded was the error
      if control_string.include?(line[character_index..-1])
        puts "(#{character_index - 1},#{line_index})"
        break
      end
    end
  end
end