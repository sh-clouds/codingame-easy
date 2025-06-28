move_x = 0.3
move_y = 0.4
move_xy = 0.5

x_coordinate, y_coordinate = gets.split.map { |x| x.to_i }
u_coordinate, v_coordinate = gets.split.map { |x| x.to_i }

difference_x = (x_coordinate - u_coordinate).abs
if difference_x > 100
  difference_x = 200 - difference_x
end

difference_y = (y_coordinate - v_coordinate).abs
if difference_y > 75
  difference_y = 150 - difference_y
end

zw = difference_x * move_xy
zw2 = (difference_x - difference_y).abs * move_y
if difference_x > difference_y
  zw = difference_y * move_xy
  zw2 = (difference_x - difference_y).abs * move_x
end

zw += zw2
puts format('%.1f', zw)