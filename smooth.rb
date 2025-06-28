number_of_cases = gets.to_i
number_of_cases.times do |case_index|
  current_number = gets.to_i

  # We have to reach 1 by dividing by 5, 3 or 2. If we can't divide by any of these the game can't be won.
  while current_number > 1
    if current_number % 5 == 0
      current_number /= 5
    elsif current_number % 3 == 0
      current_number /= 3
    elsif current_number % 2 == 0
      current_number /= 2
    else
      puts "DEFEAT"
      break
    end
  end
  puts "VICTORY" if current_number == 1
end