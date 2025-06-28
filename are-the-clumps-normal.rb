N = gets.chomp
s_res = "Normal"
s_prev = 0
s_cur = 0
s_rest = -1

(2...10).each do |i|
  l_rest = 0
  s_cur = 0
  s_rest = (N[0].to_i) % i

  N.each_char do |c|
    l_rest = (c.to_i) % i
    s_cur += 1 if s_rest != l_rest
    s_rest = l_rest
  end

  if s_cur < s_prev
    s_res = i.to_s
    break
  end
  s_prev = s_cur
end

puts s_res