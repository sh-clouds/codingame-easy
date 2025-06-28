matches = gets.chomp.match(/(.*)([+-])(.*)/)
m = gets.to_i

cr = matches[1]
ci = matches[3].to_f * (matches[2] == "-" ? -1 : 1)
nr, ni = 0.0, 0.0

iteration = 1
while iteration < m
  # [a,b]^2 is defined as [a^2-b^2, 2*a*b]
  nr, ni = [nr**2 - ni**2 + cr.to_f, 2 * nr * ni + ci]

  break if Math.sqrt(nr**2 + ni**2) > 2

  iteration += 1
end

puts iteration