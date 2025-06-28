num_of_lines_of_offering_statement = gets.to_i
data = {}
num_of_lines_of_offering_statement.times do
  offer = gets.chomp
  a, b = offer.split('=')
  price = a[1..-2].to_i
  b[1..-1].each_char do |ch|
    data[ch] = price
  end
end

total = 0
garden_height = gets.to_i
garden_height.times do
  garden_row = gets.chomp
  garden_row.each_char do |ch|
    total += data[ch] if data.key?(ch)
  end
end

if total >= 1000
  puts "$#{total / 1000},#{format('%03d', total % 1000)}"
else
  puts "$#{total}"
end