# Get required inputs
operation = gets.chomp
pseudo_random_number = gets.chomp.to_i

# Get rotors and store in array.
rotors = []
3.times do
  rotors << gets.chomp
end

# Get message
message = gets.chomp

# If Encode then encode
if operation == "ENCODE"
  encoded_characters = []
  message.each_char do |char|
    # Add pseudo_random_number to current character - IF required wrap value.
    value = char.ord + pseudo_random_number
    if value > 'Z'.ord
      value = 'A'.ord + (value - 'A'.ord) % 26
    end
    encoded_characters << value.chr
    # Increment pseudo_random_number
    pseudo_random_number += 1
  end
  # Form message and rotate
  message = encoded_characters.join
  rotors.each do |rotor|
    message = message.chars.map { |i| rotor[i.ord - 'A'.ord] }.join
  end
# If decode then decode - Reverse of encoding - Rotate first then shift
else
  # Complete backwards rotations with rotors
  alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  rotors.reverse.each do |rotor|
    decoded_characters = message.chars.map { |i| alphabet[rotor.index(i)] }
    message = decoded_characters.join
  end
  # Shift values using pseudo_random_number
  decoded_characters = []
  message.each_char do |char|
    value = char.ord - pseudo_random_number
    if value < 'A'.ord
      value = 'A'.ord + ((value - 'A'.ord) % 26)
    end
    decoded_characters << value.chr
    pseudo_random_number += 1
  end
  message = decoded_characters.join
end

# Output the encoded/decoded message
puts message
