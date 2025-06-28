# The code reads a line of input, splits it into an array, and takes the last three elements
crazy_list = gets.strip.split.last(3)

# All the numbers are the same, just re-print the last number
if crazy_list.uniq.length == 1
  puts crazy_list.last
else
  # We only work with basic operators + - * / => Un+1 = Un * a + b, Un+2 = Un+1 * a + b
  # a = (Un+1 - b) / Un
  # b = Un+2 - Un+1 * a
  #
  # a = (Un+1 - (Un+2 - Un+1 * a)) / Un => a = (Un+1 - Un+2) / (Un - Un+1)

  last_number = crazy_list.pop.to_f
  second_last_number = crazy_list.pop.to_f
  third_last_number = crazy_list.pop.to_f

  a = (second_last_number - last_number) / (third_last_number - second_last_number)
  b = last_number - second_last_number * a

  puts (last_number * a + b).round
end