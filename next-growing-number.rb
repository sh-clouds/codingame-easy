def next_growing(number_string)
    number_string.length.times do |index|
      c1 = number_string.length - 1 - index
  
      if number_string[c1] != '9'
        number_string[c1] = (number_string[c1].ord + 1).chr
        (c1 + 1...number_string.length).each { |c2| number_string[c2] = '0' }
        break
      end
  
      if c1 == 0
        (0...number_string.length).each { |c2| number_string[c2] = '0' }
        number_string.insert(0, '1')
      end
    end
  
    current_char = number_string[0]
    did_change = false
    number_string.each_char.with_index do |char, index|
      if char < current_char || did_change
        number_string[index] = current_char
        did_change = true
      end
      current_char = number_string[index]
    end
  
    number_string
end
  
number_input = gets.chomp
puts next_growing(number_input)