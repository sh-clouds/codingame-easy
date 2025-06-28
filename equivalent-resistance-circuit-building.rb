def get_resistance(resistor_string, resistor_values)
  bin = resistor_string[2...-2].split(' ')
  numbers = Array.new(bin.length)

  bin.each_with_index do |value, index|
    if valid_decimal?(value)
      numbers[index] = value.to_f
    else
      numbers[index] = resistor_values[value]
    end
  end

  if resistor_string[0] == '('
    return numbers.sum.round(1)
  elsif resistor_string[0] == '['
    return (1 / numbers.map { |num| 1 / num }.sum).round(1)
  end

  return 0
end

def valid_decimal?(string)
  true if Float(string) rescue false
end


number_of_resistors = gets.to_i
resistor_values = {}
resistors_string = ""

number_of_resistors.times do
  inputs = gets.split(' ')
  resistor_values[inputs[0]] = inputs[1].to_f
end

circuit_expression = gets.chomp

until valid_decimal?(circuit_expression)
  circuit_expression.chars.each_with_index do |char, index|
    if char == '(' || char == '['
      resistors_string = ""
    end

    resistors_string += char

    if char == ')' || char == ']'
      break
    end
  end
  circuit_expression.gsub!(resistors_string, get_resistance(resistors_string, resistor_values).to_s)
end
puts format('%.1f', circuit_expression.to_f.round(1))
