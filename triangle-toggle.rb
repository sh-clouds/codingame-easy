class Triangle
  def initialize(x1, y1, x2, y2, x3, y3)
    @x1 = x1
    @y1 = y1
    @x2 = x2
    @y2 = y2
    @x3 = x3
    @y3 = y3
  end

  def in_triangle(x, y)
    area == self.class.area(@x1, @y1, @x2, @y2, x, y) +
    self.class.area(@x1, @y1, x, y, @x3, @y3) +
    self.class.area(x, y, @x2, @y2, @x3, @y3)
  end

  def area
    (1.0 * @x1 * (@y2 - @y3) + @x2 * (@y3 - @y1) + @x3 * (@y1 - @y2)).abs
  end

  def self.area(x1, y1, x2, y2, x3, y3)
    (1.0 * x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2)).abs
  end
end

input = gets.chomp.split.map(&:to_i)
height = input[0]
width = input[1]
expanded = gets.chomp == "expanded"
how_many_triangles = gets.to_i

triangles = Array.new(how_many_triangles) do
  Triangle.new(*gets.split.map(&:to_i))
end

(0...height).each do |i|
  (0...width).each do |j|
    fill = true
    triangles.each do |triangle|
      fill = !fill if triangle.in_triangle(j, i)
    end
    print (fill ? "*" : " ") + (expanded && j != width - 1 ? " " : "")
  end
  puts
end

