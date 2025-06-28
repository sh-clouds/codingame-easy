n = gets.to_i

power = n ** 2

# Get the prime factors of n and their weight
def prime_factors(n)
  factors = {}
  divisor = 2

  while n >= 2 do
    if n % divisor == 0
      factors[divisor] = (factors[divisor] || 0) + 1
      n /= divisor
    else
      divisor += 1
    end
  end
  factors
end

primes = prime_factors(power)

# Get all the values for the prime based on weight,
# example prime 3, weight 4
# 1, 3, 9, 27, 81
factorization = {}

primes.each do |prime, weight|
  (0..weight).each do |exp|
    factorization[prime] ||= []
    factorization[prime] << prime ** exp
  end
end

# Reset indexes
factorization = factorization.values

# Generate all the divisors of power
divisors = factorization[0]

(1...factorization.length).each do |i|
  temp_divisors = []
  factorization[i].each do |value|
    divisors.each do |divisor|
      temp_divisors << divisor * value
    end
  end
  divisors = temp_divisors
end

# Sort the list by x in descending order.
divisors.sort!.reverse!

# x = n+a, y = n+n^2/a where a is a divisor of n^2
(0...(divisors.length / 2.0).ceil).each do |i|
  puts "1/#{n} = 1/#{n + divisors[i]} + 1/#{n + power / divisors[i]}"
end
