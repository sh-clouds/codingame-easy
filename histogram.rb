def barline1(length)
  return '  +' + ('-' * length + '+' if length > 0).to_s
end

def barline(first_value, second_value)
  return barline1([first_value, second_value].max) if first_value == second_value || first_value == 0 || second_value == 0
  min_value, max_value = [first_value, second_value].minmax
  return '  +' + '-' * min_value + '+' + '-' * (max_value - min_value - 1) + '+'
end

input_string = gets.chomp.upcase
uppercase_letters = ('A'..'Z').to_a
letter_count = uppercase_letters.each_with_object({}) do |letter, count_hash|
  count_hash[letter] = input_string.count(letter)
end
total_count = letter_count.values.sum
last_value = 0

uppercase_letters.each do |letter|
  current_value = letter_count[letter] * 100.0 / total_count
  rounded_value = current_value.round
  puts barline(last_value, rounded_value)
  puts "#{letter} |" + (' ' * rounded_value + '|' if rounded_value > 0).to_s + format('%.2f', current_value) + '%'
  last_value = rounded_value
end

puts barline(last_value, 0)