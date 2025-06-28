encoding = {}
message = ""
max_key_size = 0
number_of_inputs = gets.to_i

number_of_inputs.times do
    inputs = gets.split
    key = inputs[0]
    max_key_size = [max_key_size, key.length].max
    char_code = inputs[1].to_i
    encoding[key] = char_code.chr
end

input_string = gets.chomp

def decode(message, index, input_string, encoding)
    text = input_string[index..-1]
    return message if text.empty?
    return "DECODE FAIL AT INDEX #{index}" unless encoding.keys.any? { |key| text.start_with?(key) }
    encoding.keys.each do |key|
        if text.start_with?(key)
            return decode("#{message}#{encoding[key]}", index + key.length, input_string, encoding)
        end
    end
end

puts decode("", 0, input_string, encoding)