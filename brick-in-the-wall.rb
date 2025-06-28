x_value = gets.to_i
n_value = gets.to_i
input_values = gets.split(" ")
array_values = []

(0...n_value).each do |index|
  m_value = input_values[index].to_i
  array_values.push(m_value)
end

array_values.sort! { |a, b| b <=> a }

minimal_work = 0

(0...n_value).each do |index|
  l_value = (index - (index % x_value)) / x_value
  w_value = ((l_value * 6.5) / 100) * 10 * array_values[index]
  minimal_work += w_value
end
f = (minimal_work * 1000).round / 1000.0
puts ("%.3f" % f)