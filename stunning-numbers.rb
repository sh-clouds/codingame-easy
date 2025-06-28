def is_strobogrammatic(number)
    flip_map = {
      '0' => '0', '1' => '1', '2' => '2', '5' => '5',
      '6' => '9', '8' => '8', '9' => '6'
    }
  
    n = number.length
    chars = number.chars
    
    (0..(n / 2)).each do |i|
      c = chars[i]
      return false unless flip_map.key?(c) && chars[n - i - 1] == flip_map[c]
    end
    true
end
  
def reverse_number(number, is_odd)
    flip_map = {
        '0' => '0', '1' => '1', '2' => '2', '5' => '5',
        '6' => '9', '8' => '8', '9' => '6'
    }

    result = number.chars
    reversed =  if is_odd
                    number[0...-1].chars.reverse.map { |c| flip_map[c] }.join
                else
                    number.chars.reverse.map { |c| flip_map[c] }.join
                end

    result.concat(reversed.chars)
    result.join
end
  
def next_strobogrammatic(number)
    current =   if is_strobogrammatic(number)
                puts "true"
                (number.to_i + 1).to_s
            else
                puts "false"
                number
            end

    valid_digits = "0125689"
    n = current.length
    is_odd = n.odd?
    prefix = current[0...((n + 1) / 2)]

    loop do
        i = 0
        while i < prefix.length
            if valid_digits.include?(prefix[i])
                i += 1
            else
                zeros = prefix.length - i - 1
                prefix_part = prefix[0..i]
                incremented = (prefix_part.to_i + 1).to_s
                is_odd = incremented.length > prefix_part.length ? !is_odd : is_odd
                prefix = "#{incremented}#{'0' * zeros}"
                i = 0
            end
        end
  
        result = reverse_number(prefix, is_odd)
        if is_strobogrammatic(result) && result.to_i > current.to_i
            return result
        end
    
        incremented = (prefix.to_i + 1).to_s
        if incremented.length > prefix.length
            prefix = is_odd ? incremented[0...-1] : incremented
            is_odd = !is_odd
        else
            prefix = incremented
        end
    end
end
  
input_line = gets.chomp
n = input_line.strip

puts next_strobogrammatic(n)