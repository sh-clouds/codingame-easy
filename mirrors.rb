THRESHOLD_LIGHT = 10 ** -10

number_of_mirrors = gets.to_i
reflection_coefficients = gets.chomp.split.map(&:to_f)

empty_array = Array.new(number_of_mirrors + 1, 0.0)
mirrors_left = empty_array.dup
mirrors_right = empty_array.dup
mirrors_left[0] = 1.0

total_reflected_light = 0.0
number_of_turns = 0

begin
    loop_mirrors_left = empty_array.dup
    loop_mirrors_right = empty_array.dup

    not_enough_light = true

    (0...number_of_mirrors).each do |index|
        # We consider the light doesn't exist anymore if it's below the threshold
        if mirrors_left[index] > THRESHOLD_LIGHT
            reflected_light = mirrors_left[index] * reflection_coefficients[index]

            if index == 0
                total_reflected_light += reflected_light # This light is reflected to the source
            else
                loop_mirrors_right[index - 1] += reflected_light
            end

            loop_mirrors_left[index + 1] += mirrors_left[index] - reflected_light # Light is coming from the left

            not_enough_light = false
        end
        
        # We consider the light doesn't exist anymore if it's below the threshold
        if mirrors_right[index] > THRESHOLD_LIGHT
            reflected_light = mirrors_right[index] * reflection_coefficients[index]

            if index == 0
                total_reflected_light += mirrors_right[index] - reflected_light # This light is reflected to the source
            else
                loop_mirrors_right[index - 1] += mirrors_right[index] - reflected_light
            end

            loop_mirrors_left[index + 1] += reflected_light # Light is coming from the right

            not_enough_light = false
        end
    end

    mirrors_left = loop_mirrors_left
    mirrors_right = loop_mirrors_right

    number_of_turns += 1
end while not_enough_light == false

puts format('%.4f', total_reflected_light)