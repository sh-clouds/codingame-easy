input_data = gets.chomp.gsub(':', ' ').split(',')
height = input_data.length
type = input_data[1][0]
input_data[0] = '-' + input_data[0] + '-'
length = input_data.map(&:length).max

case type
when 'C'
    header = '#' * (length + 4)
    bottom = header
    first = '##'
    border = '#'
when 'R'
    header = '/' + '#' * (length + 2) + '\\'
    bottom = '\\' + '#' * (length + 2) + '/'
    first = '##'
    border = '#'
when 'E'
    header = '/' + '-' * (length + 2) + '\\'
    bottom = '\\' + '_' * (length + 2) + '/'
    first = '||'
    border = '|'
when 'L'
    header = 'X' + ('\\' + '_' * (2 - length % 2) + '/').center(length + 2, '-') + 'X'
    bottom = 'X' + '_' * (length + 2) + 'X'
    first = '[]'
    border = '|'
else
    puts '!!!!!'
end

puts header
(0...height).each do |i|
    pl = input_data[i]
    if i == 0
        pl = ' ' * ((length - pl.length) % 2) + pl
        puts first[0] + pl.center(length + 2) + first[1]
    elsif i == 1
        pl = ' ' * ((length - pl.length) % 2) + pl
        puts border + pl.center(length + 2) + border
    else
        puts border + ' ' + pl.ljust(length + 1) + border
    end
end
puts bottom