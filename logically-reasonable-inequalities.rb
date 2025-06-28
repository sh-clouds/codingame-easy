array = []
number_of_inputs = gets.to_i
number_of_inputs.times do
    relationship = gets.chomp.split(" > ")
    if !array.include?(relationship[0])
        array << relationship[0]
    end
    if !array.include?(relationship[1])
        array << relationship[1]
    end
    if array.index(relationship[0]) > array.index(relationship[1])
        puts "contradiction"
        exit
    end
end
puts "consistent"