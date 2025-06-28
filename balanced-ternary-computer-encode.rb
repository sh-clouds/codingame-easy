# Get input number.
start = n = gets.to_i

# Store sign and convert to positive.
sign = n > 0 ? 1 : -1
n = n.abs

# Convert to Base 3 - T represents -1: remainder 2 == remainder -1 with n+1
out = ""
while n > 0 || n < 0
    rem = n % 3
    if rem == 2
        out += "T"
        n += 1
    else
        out += rem.to_s
    end
    n /= 3
end

# If negative swap values.
output = ""
idx = {"0" => "0", "1" => "T", "T" => "1"}
if sign == -1
    output = out.reverse.chars.map { |i| idx[i] }.join
end

# Print correct balanced ternary.
if start == 0
    puts "0"
else
    puts output.empty? ? out.reverse : output
end