pattern = /(.+)\(([^)]+)\)/
d = gets.to_i
n = gets.to_i
v = {}

n.times do
    match = gets.match(pattern)
    v[match[1]] = match[2].split(',').map(&:to_i)
end

NAME = "name"
VAL  = "val"
DIST = "dist"

min_result = { NAME => "", VAL => [], DIST => Float::INFINITY }
max_result = { NAME => "", VAL => [], DIST => 0.0 }

v.each do |k1, v1|
    v.each do |k2, v2|
        next if k2 == k1
        name = "#{k1}#{k2}"
        val = v1.zip(v2).map { |x, y| y - x }
        dist = Math.sqrt(val.sum { |x| x**2 })

        if dist < min_result[DIST]
            min_result = { NAME => name, VAL => val, DIST => dist }
        end
        if dist > max_result[DIST]
            max_result = { NAME => name, VAL => val, DIST => dist }
        end
    end
end

puts "#{min_result[NAME]}(#{min_result[VAL].join(',')})"
puts "#{max_result[NAME]}(#{max_result[VAL].join(',')})"
