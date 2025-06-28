S = 16
res = 0
L = ' ' * S

S.times do
  L0 = L.dup
  L = gets.chomp
  inside = false
  L.chars.each_with_index do |c, j|
    if c == '|' || (c == '+' && ['|', '+'].include?(L0[j]))
      inside = !inside
    elsif c == 'o' && inside
      res += 1
    end
  end
end
puts res