# Read the length of the room array
length_of_rooms = gets.to_i

# Create a dictionary that maps each room character to its index
rooms = Hash[gets.strip.chars.each_with_index.to_a]

# Read the number of tests and the variable K
number_of_tests, k_variable = gets.strip.split.map(&:to_i)
current_character2 = ""

number_of_tests.times do
  previous_room = ""
  distance_travelled = 1

  gets.strip.chars.each do |current_character|
    current_character2 = current_character
    # No info about the current room, just increase the distance
    if current_character == "#"
      distance_travelled += 1
    else
      # If the min distance between the 2 rooms is greater than the time it took to the player, they are sus
      if !previous_room.empty? && previous_room != current_character && [rooms[current_character] - rooms[previous_room], rooms[previous_room] - rooms[current_character]].map { |d| (d + length_of_rooms) % length_of_rooms }.min > distance_travelled
        puts "SUS"
        break
      end
      distance_travelled = 1
      previous_room = current_character
    end
  end

  puts "NOT SUS" if previous_room.empty? || previous_room == current_character2
end