def get_chromosomes(input_string, index)
  # Helper function to extract chromosomes pairs from the input string.
  # Parameters:
  # input_string - String to be extracted from
  # index - The id of the first : character. Used to split between name and chromosomes.
  # Return - Array of strings of pairs of chromosomes.
  input_string[index + 1..-1].lstrip.split(" ")
end

# Get mother's chromosomes pairs.
mother = gets.chomp
mothers_chromosomes = get_chromosomes(mother, mother.index(":"))

# Get child's chromosomes pairs.
child = gets.chomp
child_chromosomes = get_chromosomes(child, child.index(":"))

# Find the chromosomes given from the father or both if indistinguishable from mothers.
chromosomes_to_find = []
child_chromosomes.each_with_index do |child_chromosome, index|
  mother_chromosome = mothers_chromosomes[index]
  if child_chromosome == mother_chromosome || child_chromosome.reverse == mother_chromosome
    chromosomes_to_find << child_chromosome
    next
  end
  child_chromosome.chars.each do |char|
    if child_chromosome.count(char) == 2
      chromosomes_to_find << char
      break
    elsif !mother_chromosome.include?(char)
      chromosomes_to_find << char
      break
    end
  end
end

# Check for father. All of chromosomes_to_find will be in the father's chromosomes. 
number_of_possible_fathers = gets.to_i
father_name = nil
number_of_possible_fathers.times do
  # Split father string and get name and chromosomes.
  possible_father = gets.chomp
  split_index = possible_father.index(":")
  father_name = possible_father[0...split_index]
  chromosomes = get_chromosomes(possible_father, split_index)
  valid = true

  # Check all pairs and break if not compatible.
  chromosomes_to_find.each_with_index do |child_chromosome, index|
    father_chromosome = chromosomes[index]
    if child_chromosome.length == 2
      unless father_chromosome.include?(child_chromosome[0]) || father_chromosome.include?(child_chromosome[1])
        valid = false
        break
      end
    else
      unless father_chromosome.include?(child_chromosome)
        valid = false
        break
      end
    end
  end
  # If still valid, break the loop and print.
  if valid
    break
  end
end

# Output name of father of the child.
puts "#{father_name}, you are the father!"
