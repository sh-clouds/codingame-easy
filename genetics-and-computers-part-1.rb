first_parameter, second_parameter = gets.chomp.split
ratio = gets.chomp

first_combinations = [
  first_parameter[0] + first_parameter[2],
  first_parameter[0] + first_parameter[3],
  first_parameter[1] + first_parameter[2],
  first_parameter[1] + first_parameter[3]
]

second_combinations = [
  second_parameter[0] + second_parameter[2],
  second_parameter[0] + second_parameter[3],
  second_parameter[1] + second_parameter[2],
  second_parameter[1] + second_parameter[3]
]

genotype_count = Hash.new(0)

first_combinations.each_with_index do |first_combination, i|
  second_combinations.each_with_index do |second_combination, j|
    combined_string = (first_combination[0] < second_combination[0]) ? 
      first_combination[0] + second_combination[0] : 
      second_combination[0] + first_combination[0]
    combined_string += (first_combination[1] < second_combination[1]) ? 
      first_combination[1] + second_combination[1] : 
      second_combination[1] + first_combination[1]

    genotype_count[combined_string] += 1
  end
end

minimum_value = 16 # Max possible
outputs = []

ratio.split(':').each do |genotype|
  value = genotype_count[genotype] || 0
  outputs << value
  minimum_value = value if value != 0 && value < minimum_value
end

# Ratio of each genotypes
outputs = outputs.map { |output| output / minimum_value }

puts outputs.join(':')