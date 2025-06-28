def rotate_45(square, size)
  new_square = []
  (1..size).each do |i|
    line = [''] * (size - i)
    indices = []
    (0...i).each do |j|
      indices << (size - j - 1)
    end
    indices.reverse!
    indices.each_with_index do |ind, j|
      line << square[j][ind]
    end
    line += [''] * (size - i)
    new_square << line
  end
  (size - 1).downto(1) do |i|
    line = [''] * (size - i)
    indices = []
    (0...i).each do |j|
      indices << (j + size - i)
    end
    indices.each_with_index do |ind, j|
      line << square[ind][j]
    end
    line += [''] * (size - i)
    new_square << line
  end
  new_square
end

def rotate_90(square, size)
  new_square = []
  (0...size).each do |i|
    new_square << (0...size).map { |j| square[j][-i - 1] }
  end
  new_square
end

size = gets.to_i
angle = gets.to_i

square = []
(0...size).each do
  square << gets.chomp.split
end

while angle > 90
  angle -= 90
  square = rotate_90(square, size)
end

sq = rotate_45(square, size)

sq.each do |s|
  puts s.join(' ')
end

