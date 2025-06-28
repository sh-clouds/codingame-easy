pattern_length = gets.to_i
pattern = gets.chomp
stock_length = gets.to_i
stock = gets.chomp
height, width = gets.chomp.split.map(&:to_i)

height.times do
  depthmap = gets.chomp
  current_pattern = pattern.chars
  current_stock = stock.chars
  depth = 0
  position = 0
  result_string = ''
  
  depthmap.each_char do |char|
    change = char.to_i - depth
    while change != 0
      if change > 0
        current_pattern.delete_at(position)
        position = 0 if position >= current_pattern.length
        change -= 1
      else
        item = current_stock.delete_at(change.abs - 1)
        current_pattern.insert(position, item)
        change += 1
      end
    end
    result_string += current_pattern[position % current_pattern.length]
    position = (position + 1) % current_pattern.length
    depth = char.to_i
  end
  puts result_string
end