lines = []
crossing = 0

xA, yA, xB, yB = gets.split.map(&:to_i)
n = gets.to_i
n.times do
  a, b, c = gets.split.map(&:to_i)

  if a != 0
    line = [1, b.to_f / a, c.to_f / a]
  else
    line = [0, 1, c.to_f / b]
  end

  next if lines.include?(line) # This is an identical line

  lines << line

  vA = a * xA + b * yA + c # Value using point A
  vB = a * xB + b * yB + c # Value using point B

  if vA == 0 || vB == 0
    puts ("ON A LINE") # If the point is on the line the value is 0
    exit
  end  
  crossing += 1 if vA * vB < 0 # If one value is positive and the other negative, the points are on a different side of the line 
end

puts (crossing % 2 == 0) ? "YES" : "NO"