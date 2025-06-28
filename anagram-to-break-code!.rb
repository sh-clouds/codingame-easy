# Get word and sentence (Convert to lower as case insensitive)
word = gets.chomp.downcase
s = gets.chomp.downcase

# Alter the sentence to remove punctuation and replace ! with spaces.
s = s.gsub("!", " ")
s = s.gsub(".", " ")
s = s.gsub(",", " ")
s = s.gsub(":", " ")
s = s.gsub("?", " ")
tmp = []
s.split(" ").each do |i|
  tmp << i unless i.empty?
end
s = tmp

def is_anagram(word1, word2)
  """
  Helper function to determine if word1 is an anagram of word2. 
  Word can't be anagram if they're the same word.

  Parameters:
  word1 : string - Word to be checked for anagram.
  word2 : string - Word to be checked for anagram.

  Return : boolean - Boolean value: true if anagram otherwise false.
  """
  hashmap1 = word1.chars.tally
  hashmap2 = word2.chars.tally
  hashmap1 == hashmap2 && word1 != word2
end

# Find the index of the key
word_idx = -1
i = 0
while i < s.length
  if is_anagram(s[i], word)
    word_idx = i
    break
  end
  i += 1
end

# Calculate the required digits for code.
# (Possible to do position 0 and 2 while finding the key but put here for readability)
digits = [0, 0, 0, 0]
digits[0] = i
digits[1] = s.length - i - 1
s[0...word_idx].each do |word|
  digits[2] += word.length
end
s[(word_idx + 1)..-1].each do |word|
  digits[3] += word.length
end

# Output the correct code. [Last digit of each value]
if word_idx == -1
  puts "IMPOSSIBLE"
else
  puts "#{digits.map { |i| i % 10 }.join('.')}"
end

