require 'bigdecimal'

input_data = gets.strip
# Read and preprocess input
raw_time = input_data.split(" ")
hh_mm_ss = raw_time[0].split(":")
str_timezone = raw_time[1][3..-1].split(":")
sign_timezone = str_timezone[0][0]
str_timezone[0] = str_timezone[0][1..-1]
# Original timezone, as minutes. Expected to be from -720 to +840
timezone_offset = (str_timezone[0].to_i * 60 + str_timezone[1].to_i) * (sign_timezone == '+' ? 1 : -1)
# Original time, separated
hours = hh_mm_ss[0].to_i
minutes = hh_mm_ss[1].to_i
seconds = hh_mm_ss[2].to_i
# Change original time to target timezone
minutes += 60 - timezone_offset
while minutes < 0
    minutes += 60
    hours -= 1
end
while minutes >= 60
    minutes -= 60
    hours += 1
end
# Correct hours of the day in case they are less than 0 or more than 23
hours = (hours + 24) % 24
# Apply formula, rounding half-up
result = (3600 * hours + 60 * minutes + seconds)
bd = BigDecimal(result) / BigDecimal("86.4")
bd = bd.round(2, BigDecimal::ROUND_HALF_UP)
puts "@" + sprintf("%.2f", bd)
