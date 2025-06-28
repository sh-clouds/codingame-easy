n = gets.to_i
command_inputs = gets.chomp.split(';')
x = command_inputs[0].to_i - 1
commands = ''

command_inputs[1..-1].each do |command_input|
  count = command_input[0...-1].to_i
  direction = command_input[-1]
  commands += direction * count
end

$stderr.puts commands
command_index = 0

(0...n).each do
  pattern = gets.chomp.split(';')
  road = pattern[1]
  (0...pattern[0].to_i).each do
    if commands[command_index] == 'R'
      x += 1
    elsif commands[command_index] == 'L'
      x -= 1
    end
    command_index += 1
    roadline = ''
    (0...road.length).each do |k|
      if x == k
        roadline += '#'
      else
        roadline += road[k]
      end
    end
    puts roadline
  end
end