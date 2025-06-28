n = gets.to_i
k = gets.to_i
result = 0
factor = 1

while n >= factor
    high = n / (factor * 10)
    current_digit = (n / factor) % 10
    low = n % factor

    # (high * factor)             : digit combinations above current position
    # (current_digit == k) * (low + 1) : extra occurrences if the current digit exactly matches k
    # (current_digit > k) * factor          : extra occurrences if the current digit is larger than k
    result += high * factor + (current_digit == k ? (low + 1) : 0) + (current_digit > k ? factor : 0)
    factor *= 10
end
puts result
