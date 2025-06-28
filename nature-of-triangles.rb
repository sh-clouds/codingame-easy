def vector_difference(point_a, point_b)
  [point_b[0] - point_a[0], point_b[1] - point_a[1]]
end

def vector_length(vector)
  Math.sqrt(vector[0]**2 + vector[1]**2)
end

def dot_product(vector1, vector2)
  vector1[0] * vector2[0] + vector1[1] * vector2[1]
end

triangles = []
number_of_triangles = gets.to_i
number_of_triangles.times do
  triangle = { 'n' => '', 'p' => [] }
  line = gets.chomp
  line.scan(/(\w) (-?\d+) (-?\d+)/) do |n, x, y|
    triangle['n'] += n
    triangle['p'] << [x.to_i, y.to_i]
  end
  triangles << triangle
end

triangles.each do |triangle|
  point_a, point_b, point_c = triangle['p']
  ab_vector = vector_difference(point_a, point_b)
  ba_vector = [-ab_vector[0], -ab_vector[1]]
  distance_ab = vector_length(ab_vector)
  bc_vector = vector_difference(point_b, point_c)
  cb_vector = [-bc_vector[0], -bc_vector[1]]
  distance_bc = vector_length(bc_vector)
  ca_vector = vector_difference(point_c, point_a)
  ac_vector = [-ca_vector[0], -ca_vector[1]]
  distance_ca = vector_length(ca_vector)

  side_nature = 'a scalene'
  [[distance_ab, distance_bc, triangle['n'][1]], [distance_bc, distance_ca, triangle['n'][2]], [distance_ab, distance_ca, triangle['n'][0]]].each do |d1, d2, vertex|
    if d1 == d2
      side_nature = 'an isosceles in ' + vertex
      break
    end
  end

  angle_a = Math.acos(dot_product(ab_vector, ac_vector) / (distance_ab * distance_ca)) * 180.0 / Math::PI
  angle_b = Math.acos(dot_product(ba_vector, bc_vector) / (distance_ab * distance_bc)) * 180.0 / Math::PI
  angle_c = Math.acos(dot_product(ca_vector, cb_vector) / (distance_ca * distance_bc)) * 180.0 / Math::PI

  angle_nature = 'an acute'
  [[angle_a, triangle['n'][0]], [angle_b, triangle['n'][1]], [angle_c, triangle['n'][2]]].each do |angle, vertex|
    if angle == 90
      angle_nature = 'a right in ' + vertex
      break
    elsif angle > 90
      angle_nature = 'an obtuse in ' + vertex + " (#{angle.round}°)"
      break
    end
  end

  puts "#{triangle['n']} is #{side_nature} and #{angle_nature} triangle."
end