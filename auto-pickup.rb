n = gets.to_i
packet = gets.chomp
sb = ""

i = 0
while i < n
    is_drop = packet[i, 3] == "101"
    str_size = packet[i + 3, 4]
    size = str_size.to_i(2)

    if is_drop
        sb += "001#{str_size}#{packet[i + 7, size]}"
    end
    i += 7 + size
end

puts sb