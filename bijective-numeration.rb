def to_decimal(str)
  str.chars.map do |c|
    case c
    when '1'..'9'
      c.to_i
    when 'A'
      10
    else
      raise "Invalid decimary symbol '#{c}'"
    end
  end.reduce(0) { |acc, digit| acc * 10 + digit }
end

def to_decimary(decimal)
  res = ''
  while decimal > 0
    case decimal % 10
    when 0
      res << 'A'
      digit = 10
    else
      res << (decimal % 10).to_s
      digit = decimal % 10
    end
    decimal = (decimal - digit) / 10
  end
  res.reverse
end

n = gets.chomp
puts to_decimary(gets.chomp.split.map { |s| to_decimal(s) }.sum)
