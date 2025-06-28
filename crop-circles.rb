# <ai>Translate C++ code to Ruby while preserving the logic and structure.</ai>
instructions = gets.chomp.split(' ')
alphabet = "abcdefghijklmnopqrstuvwxyz"
map = Array.new(19) { Array.new(25, true) }

instructions.each do |instruction|
  command = instruction
  code = 0

  if command.start_with?("PLANTMOW")
    code = 2
    command = command.sub("PLANTMOW", "")
  elsif command.start_with?("PLANT")
    code = 1
    command = command.sub("PLANT", "")
  end

  x = alphabet.index(command[0])
  y = alphabet.index(command[1])
  r = command[2..-1].to_i

  (0...19).each do |i|
    (0...25).each do |j|
      if (i - x) ** 2 + (j - y) ** 2 <= (r ** 2) / 4
        case code
        when 0
          map[i][j] = false
        when 1
          map[i][j] = true
        when 2
          map[i][j] = !map[i][j]
        end
      end
    end
  end
end


(0...25).each do |j|
  (0...19).each do |i|
    print map[i][j] ? "{}" : "  "
  end
  puts
end

