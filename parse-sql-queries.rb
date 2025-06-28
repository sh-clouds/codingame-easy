sql_query = gets.chomp
number_of_rows = gets.to_i
table_header = gets.chomp.split(' ')
table_rows = []

(0...number_of_rows).each do |i|
  row = gets.chomp.split(' ')
  table_row = []
  table_header.each_with_index do |col_name, index|
    table_row.push({
      col_name: col_name,
      value: row[index]
    })
  end
  table_rows.push(table_row)
end

cols_to_select = sql_query.split("SELECT ").last.split(' FROM').first.split(', ')
if cols_to_select[0] == "*"
  cols_to_select = table_header
end

order = nil
if sql_query.include?('ORDER BY')
  tmp = sql_query.split('ORDER BY ').last.split(' ')
  order = {
    where: tmp[0],
    equal: tmp[1]
  }
end

where = nil
if sql_query.include?('WHERE')
  tmp = sql_query.split(' WHERE ').last.split(' ORDER BY').first.split(' = ')
  where = {
    col: tmp[0],
    value: tmp[1]
  }
end

if where
  table_rows = table_rows.flat_map do |row|
    match = row.find { |e| e[:col_name] == where[:col] && e[:value] == where[:value] }
    match ? [row] : []
  end
end

def is_numeric(str)
  return false unless str.is_a?(String) # we only process strings!
  !str.empty? && !Float(str).nil? rescue false
end

if order && table_rows.length > 1
  table_rows = table_rows.sort do |a, b|
    a_value = a.find { |e| e[:col_name] == order[:where] }[:value]
    b_value = b.find { |e| e[:col_name] == order[:where] }[:value]

    if is_numeric(a_value) && is_numeric(b_value)
      a_value.to_f <=> b_value.to_f
    else
      a_value.casecmp(b_value)
    end
  end

  if order[:equal] == 'DESC'
    table_rows.reverse!
  end
end

puts cols_to_select.join(' ')

table_rows.each do |table_row|
  log = table_row.flat_map do |row|
    cols_to_select.include?(row[:col_name]) ? row[:value] : []
  end
  puts log.join(' ')
end
