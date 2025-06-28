arr = []
6.times do
  arr << gets.chomp.chars
end

tree_need_cut = 0
count_fire = 0
count_not_tree_fire = 0

6.times do |i|
  6.times do |j|
    if arr[i][j] == '*'
      count_fire += 1
      array_positions = [
        [i - 2, j - 2], [i - 2, j - 1], [i - 2, j], [i - 2, j + 1], [i - 2, j + 2],
        [i - 1, j - 2], [i - 1, j - 1], [i - 1, j], [i - 1, j + 1], [i - 1, j + 2],
        [i, j - 2], [i, j - 1], [i, j + 1], [i, j + 2],
        [i + 1, j - 2], [i + 1, j - 1], [i + 1, j], [i + 1, j + 1], [i + 1, j + 2],
        [i + 2, j - 2], [i + 2, j - 1], [i + 2, j], [i + 2, j + 1], [i + 2, j + 2]
      ]
      array_positions.each do |pos|
        if (0 <= pos[0] && pos[0] < 6) && (0 <= pos[1] && pos[1] < 6)
          if arr[pos[0]][pos[1]] == "#"
            tree_need_cut += 1
            arr[pos[0]][pos[1]] = tree_need_cut
          end
        end
      end
    elsif arr[i][j] == "=" || arr[i][j] == 'o'
      count_not_tree_fire += 1
    end
  end
end

if count_fire == 0
  puts "RELAX"
elsif count_fire + tree_need_cut + count_not_tree_fire == 36 || tree_need_cut == 0
  puts "JUST RUN"
else
  puts tree_need_cut
end