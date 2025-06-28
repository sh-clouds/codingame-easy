class Grid
  def initialize(data)
    @data = data
  end

  def row(index)
    @data[index].uniq.length == 9
  end

  def col(index)
    @data.map { |row| row[index] }.uniq.length == 9
  end

  def sub(row_index, col_index)
    subgrid = []
    (row_index...row_index + 3).each do |k|
      (col_index...col_index + 3).each do |l|
        subgrid << @data[k][l]
      end
    end
    subgrid.uniq.length == 9
  end

  def solve
    (0...9).each do |i|
      return false unless row(i) && col(i)
    end
    [0, 3, 6].each do |i|
      [0, 3, 6].each do |j|
        return false unless sub(i, j)
      end
    end
    true
  end
end

puts Grid.new(9.times.map { gets.chomp.split.map(&:to_i) }).solve.to_s.downcase
