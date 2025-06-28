# Calculates the next river number (e.g 7 -> 14, 14 -> 19, etc).
def get_next_river_number(river_number)
    next_river_number = river_number
    
    while river_number > 0
      next_river_number += river_number % 10
      river_number -= river_number % 10
      river_number /= 10
    end
    
    return next_river_number
end
  
# Read input.
river_one = gets.to_i
rivers_meet_river_one = false

# Find rivers that meet river_one.
(river_one - 1).downto(1) do |i|
    rivers_meet_river_one = (get_next_river_number(i) == river_one)
    break if rivers_meet_river_one
end
  
# Output if other rivers meet river_one.
puts rivers_meet_river_one ? "YES" : "NO"