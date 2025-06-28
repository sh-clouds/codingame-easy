# Get required inputs
steps = gets.to_i
height = gets.to_i
width = gets.to_i
rows = Array.new(height) { gets.chomp.chars }

steps.times do
  # Calculate the column weights
  column_weights = Array.new(rows[0].length, 0)
  (0...rows[0].length).each do |col|
    (0...rows.length).each do |row|
      column_weights[col] += rows[row][col].ord
    end
  end

  # Move each column by X amount
  column_weights.each_with_index do |weight, column|
    shift_amount = weight % rows.length
    shift_amount.times do
      new_column = []
      rows.each do |row|
        new_column << row[column]
      end
      new_column = [new_column[-1]] + new_column[0...-1]
      new_column.each_with_index do |value, index|
        rows[index][column] = value
      end
    end
  end

  # Calculate new row weights
  row_weights = []
  rows.each do |row|
    row_weights << row.sum { |char| char.ord }
  end

  # Move the rows by X amount
  row_weights.each_with_index do |weight, index|
    (weight % rows[0].length).times do
      rows[index] = [rows[index][-1]] + rows[index][0...-1]
    end
  end
end

# Output the rows
(0...height).each do |i|
  puts rows[i].join("")
end