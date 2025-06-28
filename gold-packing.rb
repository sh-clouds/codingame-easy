require 'json'

def solve(index, space, current_list)
  # Do we have a solution that takes more space or the same amount but with a higher priority
  #if space > space_used || (space == space_used && current_list.length <= solution.length)
  if space > $space_used || (space == $space_used && current_list.length <= $solution.length)  
    $space_used = space
    $solution.replace(current_list)
  end

  return if space == $m || index == $n  # Box is full or no bars left to test

  # We don't use the bar
  solve(index + 1, space, current_list)

  # We use the bar
  if space + $bars[index] <= $m
    current_list.push($bars[index])
    solve(index + 1, space + $bars[index], current_list)
    current_list.pop()  # Backtrack to try another solution
  end
end

$m = gets.to_i
$n = gets.to_i

$bars = gets.strip.split.map(&:to_i)
$solution = []
$space_used = 0
solve(0, 0, [])

puts $solution.join(" ")