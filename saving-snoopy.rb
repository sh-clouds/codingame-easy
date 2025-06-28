swaps = {}
n = gets.to_i

n.times do
  from_word, sign, to_word = gets.split
  swaps[from_word] = to_word
end

length = gets.to_i
encoded_message = gets.chomp
stack = []
result = ''

encoded_message.split('+').each do |char|
  if char[0] == '*'
    result += stack.pop || ''
  elsif char[0] == '#'
    number_of_pop = char[1..-1].to_i
    number_of_pop.times do
      stack.pop if stack.any?
    end
  elsif char[0] == '%'
    stack1 = []
    stack2 = []
    stack.each_with_index do |value, index|
      if index.even?
        stack1 << value
      else
        stack2 << value
      end
    end
    stack = stack1 + stack2
  else
    stack << swaps.fetch(char, char)
  end
end

lines = []
line = ''

result.split.each do |word|
  if line.length + word.length > 75
    lines << line.strip
    line = ''
  end
  line += ' ' + word
end

lines << line.strip
puts lines.join("\n")