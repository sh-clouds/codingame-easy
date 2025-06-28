# Pre-compute the number of letters at a distance of X from Y
alphabet = {}
("a".."z").each_with_index do |letter, index_letter|
  (0..25).each do |i|
    if i == 0
      alphabet[letter] = { i => 1 }
    else
      alphabet[letter][i] = (i <= index_letter ? 1 : 0) + (i <= 25 - index_letter ? 1 : 0)
    end
  end
end

alphabet.transform_values! { |distances| distances.reject { |_, count| count == 0 } } # We don't need the info with 0

radius = gets.to_i

dp = { 0 => 1 }

input_string = gets.chomp
input_string.each_char.with_index do |char, index|
  dp2 = {}

  dp.each do |distance1, count1|
    alphabet[char].each do |distance2, count2|
      if (distance = distance1 + distance2) <= radius
        dp2[distance] = (dp2[distance] || 0) + (count1 * count2)
      end
    end
  end

  dp = dp2
end

puts dp.values.sum
