def valid(number_array, divisor)
    number = 0
    number_array.each do |digit|
      number *= 10
      number += digit.to_i
    end
    number % divisor == 0
  end

number = gets.to_i
divisor = gets.to_i

# Try to remove 0 digits
if number % divisor == 0
    puts number
    return
else
    # Try to remove 1 digit, start from the right, start at zero
    number_string = number.to_s.chars
    (0..9).each do |digit_to_remove|
    (number_string.length - 1).downto(0).each do |index|
        next if number_string[index].to_i != digit_to_remove

        new_number_array = number_string.each_with_index.reject { |_, i| i == index }.map(&:first)
        if valid(new_number_array, divisor)
        print_number = new_number_array.join.to_i
        puts print_number
        return
        end
    end
    end

    # Try to remove 2 digits, start from the right, start at zero
    (0..9).each do |digit_to_remove|
    (number_string.length - 1).downto(0).each do |index|
        next if number_string[index].to_i != digit_to_remove

        new_number_array = number_string.each_with_index.reject { |_, i| i == index }.map(&:first)
        
        # Remove another digit
        (0..9).each do |second_digit_to_remove|
        (new_number_array.length - 1).downto(0).each do |second_index|
            next if new_number_array[second_index].to_i != second_digit_to_remove

            new_number_array_two = new_number_array.each_with_index.reject { |_, i| i == second_index }.map(&:first)
            if valid(new_number_array_two, divisor)
            print_number = new_number_array_two.join.to_i
            puts print_number
            return
            end
        end
        end
    end
    end
end
# Not possible
puts 0
