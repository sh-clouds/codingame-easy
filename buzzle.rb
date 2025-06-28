def sum_of_digits(number, base = 10)
  total = 0
  while number != 0
    total += number % base
    number /= base
  end
  total
end

def buzzle(number, base, tests)
  tests.each do |test|
    return true if number % test == 0 || test == number % base
  end
  return false if number < base
  buzzle(sum_of_digits(number, base), base, tests)
end

base, a, b = gets.split.map { |x| x.to_i }
k = gets.to_i
tests = gets.split.map(&:to_i)

(a..b).each do |num|
  STDERR.puts "num : #{num}"
  puts buzzle(num, base, tests) ? "Buzzle" : num.to_s
end


