def next_letter(letter)
    if letter[1] == 'Z'
      if letter[0] == 'Z'
        return "AA"
      else
        return (letter[0].ord + 1).chr + 'A'
      end
    else
      return letter[0] + (letter[1].ord + 1).chr
    end
  end
  
  input_array = gets.chomp.split('-')
  number_to_add = gets.chomp.to_i
  
  if input_array[1].to_i + number_to_add > 999
    (0...((input_array[1].to_i + number_to_add) / 999).to_i).each do
      if input_array[2] == "ZZ"
        input_array[0] = next_letter(input_array[0])
      end
      input_array[2] = next_letter(input_array[2])
    end
    input_array[1] = ((input_array[1].to_i + number_to_add) % 999).to_s.rjust(3, '0')
  else
    input_array[1] = (input_array[1].to_i + number_to_add).to_s.rjust(3, '0')
  end
  
  puts input_array.join('-')