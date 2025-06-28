input_string = gets.chomp.downcase
input_string = input_string.gsub(/ {2,}/, ' ')
input_string = input_string.gsub(/([a-z]) (?=[^a-z])/, '\1')
input_string = input_string.gsub(/([^a-z]) /, '\1')
input_string = input_string.gsub(/[,.!?;]+/) { |match| match[0] }
input_string = input_string.gsub(/[.][a-z]/) { |match| match.upcase }
input_string = input_string.gsub(/([,.!?;])/, '\1 ')
formatted_string = input_string[0].upcase + input_string[1..-1]
puts formatted_string.strip