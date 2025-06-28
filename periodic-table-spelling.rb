require 'set'
# Create hashmap of elements and set required variables.
elements = "H He Li Be B C N O F Ne Na Mg Al Si P S Cl Ar K Ca Sc Ti V Cr Mn Fe Co Ni Cu Zn Ga Ge As Se Br Kr Rb Sr Y Zr Nb Mo Tc Ru Rh Pd Ag Cd In Sn Sb Te I Xe Cs Ba La Ce Pr Nd Pm Sm Eu Gd Tb Dy Ho Er Tm Yb Lu Hf Ta W Re Os Ir Pt Au Hg Tl Pb Bi Po At Rn Fr Ra Ac Th Pa U Np Pu Am Cm Bk Cf Es Fm Md No Lr Rf Db Sg Bh Hs Mt Ds Rg Cn Nh Fl Mc Lv Ts Og"
elements_hash = elements.split(" ").each_with_object({}) { |char, hash| hash[char] = 1 }
chars = []
words = Set.new

# Get input and create array of elements that could be used to spell that word.
input_word = gets.chomp
input_word.each_char do |char|
  chars << char.upcase if elements_hash.key?(char.upcase)
end

(input_word.length - 1).times do |i|
  chars << input_word[i, 2].capitalize if elements_hash.key?(input_word[i, 2].capitalize)
end

# Convert to array and lowercase for better efficiency in search function.
word_lowercase = input_word.downcase
input_word_array = input_word.chars

def search(arr, chars, word_lowercase, words)
  # Convert array to lowercase string for comparison.
  word_formed = arr.join.downcase
  size = arr.length

  # If length of array is larger than given word or current doesn't equal given word - Return
  return false if size > word_lowercase.length || word_formed[0, size] != word_lowercase[0, size]

  # Goal case - Word has been formed so add to set. Set is used for unique spellings only.
  if word_formed == word_lowercase
    words.add(arr.join)
    return true
  end

  # DFS element - Search all possible combinations.
  chars.each do |char|
    temp = arr.dup
    char.each_char { |c| temp << c }
    search(temp, chars, word_lowercase, words)
  end
end

# Call DFS function.
search([], chars, word_lowercase, words)

# Return ordered words, one per line. none if no words have been formed.
sorted_words = words.to_a.sort
if sorted_words.any?
  puts sorted_words
else
  puts "none"
end