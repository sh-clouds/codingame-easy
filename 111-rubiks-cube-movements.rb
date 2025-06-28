rotations = gets.chomp.split(" ")
rotX = { "F" => "U", "B" => "D", "U" => "B", "D" => "F", "L" => "L", "R" => "R" }
rotXPrime = { "F" => "D", "B" => "U", "U" => "F", "D" => "B", "L" => "L", "R" => "R" }
rotY = { "F" => "L", "B" => "R", "U" => "U", "D" => "D", "L" => "B", "R" => "F" }
rotYPrime = { "F" => "R", "B" => "L", "U" => "U", "D" => "D", "L" => "F", "R" => "B" }
rotZ = { "F" => "F", "B" => "B", "U" => "R", "D" => "L", "L" => "U", "R" => "D" }
rotZPrime = { "F" => "F", "B" => "B", "U" => "L", "D" => "R", "L" => "D", "R" => "U" }
face1 = gets.chomp
face2 = gets.chomp

rotations.each do |element|
  case element
  when "x"
    face1 = rotX[face1]
    face2 = rotX[face2]
  when "x'"
    face1 = rotXPrime[face1]
    face2 = rotXPrime[face2]
  when "y"
    face1 = rotY[face1]
    face2 = rotY[face2]
  when "y'"
    face1 = rotYPrime[face1]
    face2 = rotYPrime[face2]
  when "z"
    face1 = rotZ[face1]
    face2 = rotZ[face2]
  when "z'"
    face1 = rotZPrime[face1]
    face2 = rotZPrime[face2]
  end
end

puts face1
puts face2