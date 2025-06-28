# Read the number of entries from standard input
number_of_entries = gets.to_i
family_tree = Hash.new { |hash, key| hash[key] = [] }

# Populate the family tree
number_of_entries.times do
  input = gets.chomp.split
  name, parent, birth_year, death_year, religion, gender = input
  family_tree[parent] << [name, birth_year, death_year, religion, gender]
end

def succession(branch)
  global_family_tree = $family_tree

  # Order branch, M first, then by year of birth ASC
  sorted_branch = branch.sort do |a, b|
    if a[4] == b[4]
      a[1] <=> b[1]
    else
      b[4] <=> a[4]
    end
  end

  sorted_branch.each do |person|
    # Still alive & not catholic
    if person[2] == "-" && person[3] != "Catholic"
      puts person[0]
    end

    # Do descendants of current person if there's any
    if global_family_tree[person[0]]
      succession(global_family_tree[person[0]])
    end
  end
end

$family_tree = family_tree
succession($family_tree['-'])