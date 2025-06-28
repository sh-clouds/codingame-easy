vowels     = "aeiouy".chars
consonants = "bcdfghjklmnpqrstvwxz".chars
adj_list   = ["adaptable", "adventurous", "affectionate", "courageous", "creative", "dependable", "determined", "diplomatic", "giving", "gregarious", "hardworking", "helpful", "hilarious", "honest", "non-judgmental", "observant", "passionate", "sensible", "sensitive", "sincere"]
good_list  = ["love", "forgiveness", "friendship", "inspiration", "epic transformations", "wins"]
bad_list   = ["crime", "disappointment", "disasters", "illness", "injury", "investment loss"]

name = gets.chomp
v_in_name = name.downcase.chars.select { |c| vowels.include?(c) }
c_in_name = name.downcase.chars.select { |c| consonants.include?(c) }.uniq

if c_in_name.length < 3 || v_in_name.length < 2
  puts "Hello #{name}."
else
  puts "It's so nice to meet you, my dear #{adj_list[consonants.index(c_in_name[0])]} #{name}."
  puts "I sense you are both #{adj_list[consonants.index(c_in_name[1])]} and #{adj_list[consonants.index(c_in_name[2])]}."
  puts "May our future together have much more #{good_list[vowels.index(v_in_name[0])]} than #{bad_list[vowels.index(v_in_name[1])] }."
end
