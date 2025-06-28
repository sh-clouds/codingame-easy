ciphertext = gets.chomp
word = gets.chomp
decoded = ''
tmp = ''
delimiters = [' ', ',', '.', '?', ';', ':', '!']
key = 0

(0...96).each do |k|
  decoded = tmp = ciphertext.dup
  cmpt = 0
  decoded.each_char do |c|
    c = ((c.ord - k - 32 + 95) % 95 + 32).chr
    tmp[cmpt] = delimiters.include?(c) ? ' ' : c
    cmpt += 1
  end

  words = tmp.split
  if words.include?(word)
    key = k
    break
  end
end

decoded = tmp = ciphertext.dup
cmpt = 0
decoded.each_char do |c|
  c = ((c.ord - key - 32 + 95) % 95 + 32).chr
  tmp[cmpt] = c
  cmpt += 1
end
 
puts "#{key}\n#{decoded}"