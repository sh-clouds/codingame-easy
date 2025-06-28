# Store the circles in an array.
circles = []
gets.to_i.times do
  x, y, z, r = gets.split.map(&:to_i)
  circles << [x, y, z, r]
end

# Increase size in order read in until it touches another circle.
radius_cubed = 0
circles.each_with_index do |circle, index|
  x, y, z, r = circle
  smallest_change = 1e6
  circles.each_with_index do |other_circle, other_index|
    # Ensure not checking with own circle.
    next if index == other_index
    
    # Find distance remaining between circles.
    x2, y2, z2, r2 = other_circle
    remaining_distance = Math.sqrt((x - x2)**2 + (y - y2)**2 + (z - z2)**2) - r - r2

    # Store the smallest change in radius required.
    smallest_change = remaining_distance if remaining_distance < smallest_change
  end

  # Update radius and store the cubed of the radius.
  circles[index][-1] += smallest_change
  radius_cubed += circles[index][-1] ** 3
end

# Print sum of radii cubed.
puts radius_cubed.round
