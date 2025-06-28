# Auto-generated code below aims at helping you parse
# the standard input according to the problem statement.
require 'json'

input_text = gets.chomp

# step 1
input_text = input_text.gsub('??=', '#')
                       .gsub('??/', '\\')
                       .gsub('??\'', '^')
                       .gsub('??(', '[')
                       .gsub('??)', ']')
                       .gsub('??!', '|')
                       .gsub('??-', '~')

# step 2
input_text = input_text.gsub(/(\\x[0-9A-Fa-f]{2}|\\u[0-9A-Fa-f]{4}|\\U[0-9A-Fa-f]{8}|\\.)/) do |match|
  if match.start_with?('\\x')
    [match[2..3].to_i(16)].pack('C')
  elsif match.start_with?('\\u')
    JSON.parse("\"#{match}\"")
  elsif match.start_with?('\\U')
    JSON.parse("\"\\u#{match[6..-1]}\"")
  else
    match[1..-1]
  end
end

# step 3
input_text = input_text.gsub(/&(\w+|#\d{2,3});/) do |match|
  entity = Regexp.last_match(1)
  if entity.start_with?('#')
    [entity[1..-1].to_i].pack('C')
  else
    case entity
    when 'amp'
      '&'
    when 'lt'
      '<'
    when 'gt'
      '>'
    when 'bsol'
      '\\'
    else
      "&#{entity};"
    end
  end
end

# Write an answer using puts. DON'T FORGET THE TRAILING \n
# To debug: puts var.inspect (equivalent to var_dump)
puts "#{input_text}\n"

