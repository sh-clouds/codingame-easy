# Check a point against a square
def check_square(x0, y0, length, x, y)
  # On horizontal border
  return [true, false] if (x == x0 || x == (x0 + length)) && y >= y0 && y <= (y0 + length)
  # On vertical border
  return [true, false] if (y == y0 || y == (y0 + length)) && x >= x0 && x <= (x0 + length)
  # Inside the square
  return [false, true] if x > x0 && x < (x0 + length) && y > y0 && y < (y0 + length)

  [false, false]
end

# Check a point against a circle
def check_circle(x0, y0, radius, x, y)
  distance = Math.sqrt((x - x0)**2 + (y - y0)**2)

  # Point is on the border
  return [true, false] if distance == radius
  # Point is inside the circle
  return [false, true] if distance < radius

  [false, false]
end

shapes = []
S, P = gets.split.map(&:to_i)
S.times do
  shapes << gets.chomp.split.map(&:to_s)
end

P.times do
  x, y = gets.split.map(&:to_i)

  sum_red = 0
  sum_green = 0
  sum_blue = 0
  count = 0
  fnext = false

  shapes.each do |shape|
    type, x0, y0, length, r, g, b = shape[0], shape[1].to_i,shape[2].to_i, shape[3].to_i, shape[4].to_i,shape[5].to_i, shape[6].to_i

    if (type == "SQUARE")
      is_on_border, is_inside = check_square(x0, y0, length, x, y) 
    elsif  (type == "CIRCLE")
      is_on_border, is_inside = check_circle(x0, y0, length, x, y)
    end

    # Point is on the border, black doesn't blend in so it will stay black
    if is_on_border == true
      puts "(0, 0, 0)"
      fnext = true
      break
    end

    if is_inside == true
      sum_red += r
      sum_green += g
      sum_blue += b
      count += 1
    end
  end

  if fnext
    next
  end

  if count == 0 && !fnext
    puts "(255, 255, 255)"
  else
    puts "(#{(sum_red.to_f / count).round}, #{(sum_green.to_f / count).round}, #{(sum_blue.to_f / count).round})"
  end

end