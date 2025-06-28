f0, n = gets.split.map { |x| x.to_i }
a, b = gets.split.map { |x| x.to_i }

f = Array.new(b + 1, 0)
f[b] = f0.to_i

(1..n).each do |_|
    (0...b).each do |prev|
    f[prev] = f[prev + 1]
    end
    f[b] = f[0..(b - a)].sum
end
puts f[b]