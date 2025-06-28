# Get hex of chars.
chars = "0x1818243C42420000, A, 0x7844784444780000, B, 0x3844808044380000, C, 0x7844444444780000, D, 0x7C407840407C0000, E, 0x7C40784040400000, F, 0x3844809C44380000, G, 0x42427E4242420000, H, 0x3E080808083E0000, I, 0x1C04040444380000, J, 0x4448507048440000, K, 0x40404040407E0000, L, 0x4163554941410000, M, 0x4262524A46420000, N, 0x1C222222221C0000, O, 0x7844784040400000, P, 0x1C222222221C0200, Q, 0x7844785048440000, R, 0x1C22100C221C0000, S, 0x7F08080808080000, T, 0x42424242423C0000, U, 0x8142422424180000, V, 0x4141495563410000, W, 0x4224181824420000, X, 0x4122140808080000, Y, 0x7E040810207E0000, Z".split(", ")
chars = chars.each_slice(2).map(&:first).map { |v| v[2..-1] }

# Get inputs word.
input_word = gets.chomp

# Store the representation for each character in input, in array.
output = []
input_word.each_char do |char|
  output << []
  value = chars[char.ord - 'A'.ord]
  (0...16).step(2) do |i|
    hex_value = value[i, 2].to_i(16).to_s(2).rjust(8, '0')
    output[-1] << [hex_value.gsub("0", " ").gsub("1", "X")]
  end
end

# Print each line, remove and trailing spaces.
(0...output[0].length).each do |i|
  row = []
  output.each_with_index do |item, j|
    row << (j != 0 ? item[i].join : item[i].join)
  end
  row_string = row.join
  puts row_string.rstrip unless row_string.strip.empty?
end
