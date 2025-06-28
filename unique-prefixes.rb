# Get words and create prefix hashmap.
prefixes = {}
words = []
n = gets.to_i
n.times do
  word = gets.chomp
  words << word
  (0...word.length).each do |i|
    prefix = word[0..i]
    prefixes[prefix] ||= 0
    prefixes[prefix] += 1
  end
end

# For each word find the largest unique prefix. If none found print first character.
words.each do |word|
  prefix = word[0]
  (word.length - 1).downto(0) do |i|
    if prefixes[word[0..i]] > 1
      prefix = word[0..i+1]
      break
    end
  end
  puts prefix
end