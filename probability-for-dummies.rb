# Read integers from standard input
m = gets.to_i
n = gets.to_i

history = {}

def solve(m, n, t, history)
  return 0 if (t + n) < m
  return 1 if t == m
  return history[t][n] if history[t] && history[t][n]

  p = (38 - t) / 38.0 # We get a new number
  p2 = 1 - p # We get a number we already had

  history[t] ||= {}
  history[t][n] = p * solve(m, n - 1, t + 1, history) + p2 * solve(m, n - 1, t, history)
end

puts "#{(solve(m, n, 0, history) * 100).round}%"
