require 'set'

def is_triad_sum(cdt, triad)
  a, b, c = triad
  [a, b, c,
   a + a, a + b, a + c, b + b, b + c, c + c,
   a + a + a, a + a + b, a + a + c, a + b + b, a + b + c, a + c + c, b + b + b, b + b + c, b + c + c, c + c + c].include?(cdt)
end

def get_canonical_triad(triad)
  triad.sort
end

input = gets.chomp.split(',').map { |x| x.to_i }
max = input.last || 0

res = Set.new
(0..max).to_a.product((0..max).to_a, (0..max).to_a).each do |i, j, k|
    triad = [i, j, k]
    if input.all? { |cdt| is_triad_sum(cdt, triad) }
        canonical = get_canonical_triad(triad)
        res.add(canonical)
    end
end

case res.size
when 0
    puts "none"
when 1
    triad = res.first
    puts "#{triad[0]},#{triad[1]},#{triad[2]}"
else
    puts "many"
end

