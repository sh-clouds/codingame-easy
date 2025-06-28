n, m, p = gets.strip.split.map(&:to_i)
count_a, count_b = gets.strip.split.map(&:to_i)

matrix_a = {}
matrix_b = {}

count_a.times do
  y, x, value = gets.strip.split.map(&:to_f)
  y, x = y.to_i, x.to_i
  matrix_a[y] ||= {}
  matrix_a[y][x] = value
end

count_b.times do
  y, x, value = gets.strip.split.map(&:to_f)
  y, x = y.to_i, x.to_i
  matrix_b[y] ||= {}
  matrix_b[y][x] = value
end

output = {}

matrix_a.each do |y_a, row|
  row.each do |x_a, value_a|
    if matrix_b[x_a]
      matrix_b[x_a].each do |x_b, value_b|
        output[y_a] ||= {}
        output[y_a][x_b] = (output[y_a][x_b] || 0) + value_a * value_b
      end
    end
  end
end

output = output.sort.to_h

output.each do |y, row|
  row = row.sort.to_h
  row.each do |x, value|
    next if value.zero?
    puts value.integer? ? "#{y} #{x} #{value.to_i}" : "#{y} #{x} #{value}"
  end
end