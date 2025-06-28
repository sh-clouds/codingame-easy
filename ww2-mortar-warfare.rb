include Math

# Input trimmed
range_input = gets.chomp.gsub(/[^0-9]/, '').to_i

# Constants
acceleration_due_to_gravity = 9.8  # Acceleration due to gravity (m/s^2)
initial_velocity = 158  # Initial velocity of the mortar round (m/s)

# Sanity checks based on M2 Mortar specifications
if range_input < 0 || range_input > 1800
    puts "OUT OF RANGE"
    exit
end

# Calculations
angle_in_radians = (asin((range_input * acceleration_due_to_gravity) / (initial_velocity * initial_velocity)) / 2) 
angle_in_degrees = angle_in_radians * (180 / Math::PI)
angle_in_degrees = [angle_in_degrees, 90 - angle_in_degrees].max
time_of_flight = (2 * initial_velocity * sin(angle_in_degrees * Math::PI / 180)) / acceleration_due_to_gravity

# Round values
angle_rounded = angle_in_degrees.round(1)
time_rounded = time_of_flight.round(1)

# Final answer check: If angle is out of range, return "OUT OF RANGE"
if angle_in_degrees <= 40 || angle_in_degrees >= 85
    puts "OUT OF RANGE"
else
    puts "#{angle_rounded} degrees\n#{time_rounded} seconds"
end