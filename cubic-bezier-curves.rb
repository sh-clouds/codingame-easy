require 'set'

# https://en.wikipedia.org/wiki/B%C3%A9zier_curve
# B(w) = (1-w)³ * P0 + 3 * (1-w)² * w * P1 + 3 * (1-w) * w² * P2 + w³ * P4 
def interpolation(weight, ax, ay, bx, by, cx, cy, dx, dy)
  x = (((1 - weight) ** 3) * ax) + (3 * ((1 - weight) ** 2) * weight * bx) + 
      (3 * (1 - weight) * (weight ** 2) * cx) + (weight ** 3) * dx
  y = (((1 - weight) ** 3) * ay) + (3 * ((1 - weight) ** 2) * weight * by) + 
      (3 * (1 - weight) * (weight ** 2) * cy) + (weight ** 3) * dy
  [x.round, y.round]
end

width, height = gets.chomp.split.map(&:to_i)
steps = gets.to_i
ax, ay = gets.chomp.split.map(&:to_i)
bx, by = gets.chomp.split.map(&:to_i)
cx, cy = gets.chomp.split.map(&:to_i)
dx, dy = gets.chomp.split.map(&:to_i)

canvas = Array.new(height) { "." + " " * (width - 1) }

(0...steps).each do |i|
  weight = i.to_f / (steps - 1)
  x, y = interpolation(weight, ax, ay, bx, by, cx, cy, dx, dy)
  canvas[height - 1 - y] = canvas[height - 1 - y][0...x] + "#" + canvas[height - 1 - y][x + 1..-1]
end

puts canvas.map(&:rstrip)