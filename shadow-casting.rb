ans = []
width = 0

n = gets.to_i
art = []

n.times do
  art << gets.chomp
  width = [width, art.last.length].max
end

ans = Array.new(n + 2) { " " * (width + 2) }

art.each_with_index do |line, y|
  line.chars.each_with_index do |char, x|
    if char != " " && char != ""
      ans[y][x] = char
      ans[y + 1][x + 1] = "-"
      ans[y + 2][x + 2] = "`"
    end
  end
end

puts ans.map(&:rstrip).join("\n")