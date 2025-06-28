# Read an integer from standard input
number_of_bits = gets.to_i

# The first possible number
binary_representation = (number_of_bits + 1).to_s(2)

# We have a triple 1 
while binary_representation =~ /111/
  match_data = binary_representation.match(/111/)
  
  # 111xxx => 1xxxxxx || xxx111x => xxx1000
  # The first one is moved left and everything after is set to 0
  if match_data.begin(0) == 0
    binary_representation = "1" + '0' * binary_representation.length
  else
    binary_representation = binary_representation[0...match_data.begin(0) - 1] + "1" + '0' * (binary_representation.length - match_data.begin(0))
  end
end

# We have a triple 0
if binary_representation =~ /000/
  match_data = binary_representation.match(/000/)
  count = binary_representation.length - match_data.begin(0)

  # xx000xxx => xx001001 || xxx000000 => xxx001001
  # We replace every bits up to the end starting at the start of the triple with the pattern 001
  (0...count).each do |i|
    if i % 3 == 2
      binary_representation[match_data.begin(0) + i] = "1"
    else
      binary_representation[match_data.begin(0) + i] = "0"
    end
  end
end

puts binary_representation.to_i(2)