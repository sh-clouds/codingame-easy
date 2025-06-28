months = ["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]

time = gets.chomp.chars.map { |c| 
    case c
    when '#' then 1
    else 0
    end
}.reduce(0) { |acc, x| 2 * acc + x }

addr = ""
gets.chomp.split.each do |word|
    a, b = word[0...(word.length / 2)], word[(word.length / 2)..-1]

    addr << (months.index(a).to_s(12) + months.index(b).to_s(12)).to_i(12).chr
end

puts format("%02d:%02d\n%s", time / 100, time % 100, addr)

