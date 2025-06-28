class Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Quad
  attr_accessor :name, :pts

  def initialize
    @name = Array.new(4) { Array.new(2) }
    @pts = Array.new(4) { Point.new(0, 0) }
  end
end

def distance(point1, point2) # distance between 2 2D points
  Math.sqrt((point1.x - point2.x)**2 + (point1.y - point2.y)**2).to_i
end

def angle(vector1, vector2) # angle between 2 vectors
  dot_product = vector1.x * vector2.x + vector1.y * vector2.y
  determinant = vector1.x * vector2.y - vector1.y * vector2.x
  Math.atan2(determinant, dot_product)
end

def is_parallel(quad) 
  vectors = Array.new(4) # vectors formed by the 4 sides
  vectors[0] = Point.new(quad.pts[0].x - quad.pts[1].x, quad.pts[0].y - quad.pts[1].y)
  vectors[1] = Point.new(quad.pts[1].x - quad.pts[2].x, quad.pts[1].y - quad.pts[2].y)
  vectors[2] = Point.new(quad.pts[2].x - quad.pts[3].x, quad.pts[2].y - quad.pts[3].y)
  vectors[3] = Point.new(quad.pts[3].x - quad.pts[0].x, quad.pts[3].y - quad.pts[0].y)

  (vectors[0].x * vectors[2].y == vectors[0].y * vectors[2].x) &&
    (vectors[1].x * vectors[3].y == vectors[1].y * vectors[3].x)
end

def is_rhombus(quad) 
  side_lengths = Array.new(4) # size of each side
  (0..2).each { |i| side_lengths[i] = distance(quad.pts[i], quad.pts[i + 1]) }
  side_lengths[3] = distance(quad.pts[3], quad.pts[0])

  side_lengths.uniq.length == 1
end

def is_rectangle(quad) 
  vectors = Array.new(4) # vectors formed by the 4 sides
  side_lengths = Array.new(4) # size of each side
  (0..2).each { |i| side_lengths[i] = distance(quad.pts[i], quad.pts[i + 1]) }
  side_lengths[3] = distance(quad.pts[3], quad.pts[0])
  
  return false if side_lengths[0] != side_lengths[2] || side_lengths[1] != side_lengths[3]

  vectors[0] = Point.new(quad.pts[0].x - quad.pts[1].x, quad.pts[0].y - quad.pts[1].y)
  vectors[1] = Point.new(quad.pts[1].x - quad.pts[2].x, quad.pts[1].y - quad.pts[2].y)
  vectors[2] = Point.new(quad.pts[2].x - quad.pts[3].x, quad.pts[2].y - quad.pts[3].y)
  vectors[3] = Point.new(quad.pts[3].x - quad.pts[0].x, quad.pts[3].y - quad.pts[0].y)
  
  angles = Array.new(4)
  (0..2).each { |i| angles[i] = angle(vectors[i], vectors[i + 1]) }
  angles[3] = angle(vectors[3], vectors[0])

  angles.all? { |a| Math.cos(a).abs < 1e-6 }
end

n = gets.to_i
n.times do
  quad = Quad.new
  input = gets.split
  4.times do |i|
    quad.name[i] = input[i * 3]
    quad.pts[i] = Point.new(input[i * 3 + 1].to_i, input[i * 3 + 2].to_i)
  end

  para = is_parallel(quad)
  rh = is_rhombus(quad)
  rec = is_rectangle(quad)
  
  print "#{quad.name[0][0]}#{quad.name[1][0]}#{quad.name[2][0]}#{quad.name[3][0]} is a "
  if rh && rec
    puts "square."
  elsif rec
    puts "rectangle."
  elsif rh
    puts "rhombus."
  elsif para
    puts "parallelogram."
  else
    puts "quadrilateral."
  end
end