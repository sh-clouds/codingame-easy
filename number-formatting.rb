# <ai>Translate the Python code to Ruby while preserving the logic and structure.</ai>

def format_number(input_string)
  decimal_position = input_string.index('.')
  before_decimal = input_string[0...decimal_position].lstrip.sub(/^0+/, '')
  after_decimal = input_string[(decimal_position + 1)..-1].rstrip.sub(/0+$/, '')
  filled_string = "#{"x" * (9 - before_decimal.length)}#{before_decimal}#{after_decimal}#{"x" * (6 - after_decimal.length)}"
  result_string = ""
  
  filled_string.chars.each_slice(3).with_index do |slice, index|
    result_string += slice.join
    result_string += [",", ",", ".", ".", ""][index] if index < 4
  end
  
  result_string
end

input_line = gets.chomp
number_string = input_line.gsub('x', '0').gsub(/[^\d]/, '')
number_string.insert(9, '.')
formatted_number = format_number(format('%.6f', number_string.to_f / 2))
puts formatted_number

