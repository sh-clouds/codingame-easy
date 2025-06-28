number_of_vertices = gets.to_i
polygon = []

number_of_vertices.times do
  x, y = gets.split.map(&:to_i)
  polygon << [x, y]
end

number_of_points = gets.to_i
number_of_points.times do
  x, y = gets.split.map(&:to_i)

  is_inside = false
  previous_vertex_index = polygon.size - 1

  polygon.each_with_index do |current_vertex, current_vertex_index|
    # The point is one of the corners => hit
    if x == current_vertex[0] && y == current_vertex[1]
      puts "hit"
      next
    end

    if (current_vertex[1] > y) != (polygon[previous_vertex_index][1] > y)
      slope = (x - current_vertex[0]) * (polygon[previous_vertex_index][1] - current_vertex[1]) - 
              (polygon[previous_vertex_index][0] - current_vertex[0]) * (y - current_vertex[1])

      # Point is on boundary => hit
      if slope == 0
        puts "hit"
        next
      end

      # Crossing a border of the polygon
      if (slope < 0) != (polygon[previous_vertex_index][1] < current_vertex[1])
        is_inside = !is_inside
      end
    end
    previous_vertex_index = current_vertex_index
  end

  # If we crossed a border an odd number of times the point is inside
  puts is_inside ? "hit" : "miss"
end
