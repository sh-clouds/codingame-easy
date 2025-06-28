thickness = gets.chomp.to_i
length = gets.chomp.to_i
turns = gets.chomp.to_i

puts " " +  "_" * thickness + (" " + "_" * (thickness*2+1)) * (turns / 2) + (if turns % 2 == 1 then " " + "_" * thickness else "" end)
puts "|" + " " * thickness + ("|"+ " " * (thickness*2+1)) * (turns / 2) + "#{(if turns % 2 == 1 then "|"  + " " * thickness else "" end)}" + "|" 

(2..length-1).each do |i|
    puts ("|" + " " * thickness) * (turns + 1) + "|"
end

puts ("|" + "_" * (thickness * 2 + 1)) * (turns / 2) + "#{ turns.even? ? '|' + '_' * thickness : '|' + '_' * (thickness * 2 + 1) }|"