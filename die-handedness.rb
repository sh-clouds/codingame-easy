key = gets.chomp.strip.to_i
values = { 1 => '23', 2 => '31', 3 => '12', 4 => '21', 5 => '13', 6 => '32' }
input_string = gets.chomp
s = input_string.chars.map(&:to_i)
input_string3 = gets.chomp

puts (s[0] + s[2] != 7 || s[1] + s[3] != 7) ? 'degenerate' : (input_string* 2).include?(values[key])  ? 'right-handed' : 'left-handed'