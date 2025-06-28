def get_directional_vector(vector1, vector2)
    directional_vector = {}
    directional_vector["i"] = vector1["i"] - vector2["i"]
    directional_vector["j"] = vector1["j"] - vector2["j"]
    directional_vector["k"] = vector1["k"] - vector2["k"]
  
    greatest_common_divisor = (gcd(directional_vector["i"], gcd(directional_vector["j"], directional_vector["k"]))).abs
  
    result_string = ""
  
    directional_vector.each do |key, value|
      next if value.zero?
  
      value /= greatest_common_divisor
  
      if value > 0
        result_string += value == 1 ? "+#{key}" : "+#{value}#{key}"
      else
        result_string += value == -1 ? "-#{key}" : "#{value}#{key}"
      end
    end
  
    result_string.sub!(/\A\+/, '')
    result_string
  end
  
  def get_distance(vector1, vector2)
    Math.sqrt((vector2["i"] - vector1["i"])**2 + (vector2["j"] - vector1["j"])**2 + (vector2["k"] - vector1["k"])**2)
  end
  
  def gcd(a, b)
    b.zero? ? a : gcd(b, a % b)
  end
  
  # Extract the three values of the vector
  def extract_vector(input_string)
    vector = { "i" => 0, "j" => 0, "k" => 0 }
    sign = "+"
    value_string = ""
  
    input_string.each_char.with_index do |char, index|
      case char
      when "+"
        sign = "+"
      when "-"
        sign = "-"
      when "i", "j", "k"
        vector[char] = (value_string.empty? ? 1 : value_string.to_i) * (sign == "+" ? 1 : -1)
        value_string = ""
      else
        value_string += char
      end
    end
  
    vector
  end
  
  ship_vector = extract_vector(gets.chomp)
  wormhole_vector = extract_vector(gets.chomp)
  
  puts "Direction: #{get_directional_vector(wormhole_vector, ship_vector)}"
  puts "Distance: #{'%.2f' % get_distance(wormhole_vector, ship_vector)}"