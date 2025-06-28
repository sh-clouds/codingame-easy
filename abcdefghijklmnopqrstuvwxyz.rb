n = gets.to_i
map = []
n.times do
  m = gets.chomp
  map << m.chars
end

def find_all_possible_start(arr)
  possible_start = []
  arr.each_with_index do |row, i|
    row.each_with_index do |value, j|
      possible_start << { i: i, j: j, char: "a" } if value == "a"
    end
  end
  possible_start
end

def find_path_helper(map, i, j, char)
  _i = i >= 0 && i < map.length
  _j = j >= 0 && j < map[0].length
  return _i && _j && char.ord + 1 == map[i][j].ord
end

def find_path(map, current_start, possible_start, p)
  if current_start.empty?
    current_start << possible_start.shift
  end

  p << current_start.shift
  current = p.last

  return p if current[:char] == "z"

  bool = [
    { value: find_path_helper(map, current[:i] - 1, current[:j], current[:char]), i: current[:i] - 1, j: current[:j] },
    { value: find_path_helper(map, current[:i] + 1, current[:j], current[:char]), i: current[:i] + 1, j: current[:j] },
    { value: find_path_helper(map, current[:i], current[:j] - 1, current[:char]), i: current[:i], j: current[:j] - 1 },
    { value: find_path_helper(map, current[:i], current[:j] + 1, current[:char]), i: current[:i], j: current[:j] + 1 }
  ]

  bool.each do |e|
    if e[:value]
      c = (current[:char].ord + 1).chr
      current_start << { i: e[:i], j: e[:j], char: c }
    end
  end

  if current_start.any?
    find_path(map, current_start, possible_start, p)
  else
    p.clear
    find_path(map, [], possible_start, p)
  end
end

possible_start = find_all_possible_start(map)
path = find_path(map, [], possible_start, [])

map.each_with_index do |row, i|
  row.each_with_index do |_, j|
    unless path.any? { |obj| obj[:i] == i && obj[:j] == j }
      map[i][j] = "-"
    end
  end
end

map.each { |row| puts row.join("") }
