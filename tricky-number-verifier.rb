require 'date'

def print_validity(input_string)
  if input_string.length != 10 || input_string[0] == '0' || !input_string.match?(/^\d+$/)
    return puts 'INVALID SYNTAX'
  end
  lll, x, ddmmyy = input_string[0..2], input_string[3], input_string[4..-1]

  begin
    Date.strptime(ddmmyy, "%d%m%y")
  rescue ArgumentError
    return puts 'INVALID DATE'
  end

  temp = input_string.chars.each_with_index.reduce(0) do |sum, (digit, index)|
    sum + digit.to_i * '3790584216'[index].to_i
  end % 11

  if temp == 10
    print_validity("#{lll.to_i + 1}0#{ddmmyy}")
  elsif x.to_i != temp
    puts "#{lll}#{temp}#{ddmmyy}"
  else
    puts 'OK'
  end
end

gets.to_i.times do
  print_validity(gets.chomp)
end
