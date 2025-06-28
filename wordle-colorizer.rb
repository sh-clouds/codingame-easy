require 'set'

# Get answer and form set.
answer = gets.chomp
answer_set = answer.chars.to_set
n = gets.to_i
n.times do
    # Get attempt and form hashmap.
    word = gets.chomp
    attempt = Hash[word.chars.map { |char| [char, answer.count(char)] }]
    
    # Set correct positions.
    output = Array.new(answer.length, "X")
    output.each_index do |i|
        if word[i] == answer[i]
            output[i] = "#"
            attempt[word[i]] -= 1
        end
    end

    # Find any out of position letters.
    word.chars.each_with_index do |char, i|
        count = attempt[char]
        if answer_set.include?(char) && count > 0 && output[i] != "#"
            output[i] = "O"
            attempt[char] -= 1
        end
    end

    # Output result of guess.
    puts output.join
end