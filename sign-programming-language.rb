input_line = gets.chomp
index = 0
result = 0
count = 0
is_counting = false

while index < input_line.length
  if input_line[index] == '$'
    if is_counting
      result += count
    else
      count = 0
    end
    is_counting = !is_counting
    index += 1
    next
  end

  if is_counting
    count += 1
  end

  if input_line[index, 3] == '/*$'
    index += 3
    next
  end

  if input_line[index, 2] == '/$'
    next_position = input_line.index('/', index + 2) || (index + 2)
    num_chars = next_position - index - 2
    result += num_chars
    index += num_chars + 3
    next
  end

  if input_line[index, 2] == '//'
    next_position = input_line.index('/', index + 2) || (index + 2)
    num_chars = next_position - index - 2
    result -= num_chars
    index += num_chars + 3
    next
  end

  if input_line[index, 3] == '/**'
    next_position = input_line.index('/', index + 3) || (index + 3)
    num_chars = next_position - index - 3
    result *= (num_chars + 1)
    index += num_chars + 4
    next
  end

  if input_line[index, 3] == '/*/'
    next_position = input_line.index('/', index + 3) || (index + 3)
    num_chars = next_position - index - 3
    result *= -num_chars
    index += num_chars + 4
    next
  end

  raise 'Invalid input'
end

puts result
