first_number, second_number = gets.chomp.split.map(&:to_i)

# Swap values if the second number is greater than the first
if second_number > first_number
  temp = first_number
  first_number = second_number
  second_number = temp
end

puts "#{first_number} * #{second_number}"

current_a = first_number
current_b = second_number

result_string = ""
while current_b != 0
  if current_b % 2 == 0
    current_b /= 2
    current_a *= 2
  else
    current_b -= 1
    result_string += " + #{current_a}"
  end
  puts "= #{current_a} * #{current_b}#{result_string}"
end

puts "= #{first_number * second_number}"