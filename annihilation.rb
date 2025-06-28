ARROW = String
POS = Struct.new(:first, :second)
height, width, turns = 0, 0, 0
state = {}

height, width = gets.chomp.split.map(&:to_i)

height.times do |i|
  line = gets.chomp
  line.each_char.with_index do |char, j|
    state[POS.new(i, j)] = char if char != '.'
  end
end

until state.empty?
  next_state = {}
  state.each do |pos, arrow|
    x = pos.first
    y = pos.second
    case arrow[0]
    when '^'
      x = (x - 1 + height) % height
    when 'v'
      x = (x + 1) % height
    when '<'
      y = (y - 1 + width) % width
    when '>'
      y = (y + 1) % width
    end
    next_state[POS.new(x, y)] ||= ''
    next_state[POS.new(x, y)] += arrow
  end

  next_state.each_key do |key|
    next_state.delete(key) if next_state[key].length > 1
  end

  state = next_state
  turns += 1
end

puts turns