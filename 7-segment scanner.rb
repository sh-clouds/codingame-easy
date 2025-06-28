line1 = gets.chomp
line2 = gets.chomp
line3 = gets.chomp

answer = []
0.upto((line1.size/3)-1) do |i|
    l1 = line1[i*3,3]
    l2 = line2[i*3,3]
    l3 = line3[i*3,3]
    if l1 != ' _ '
        if l2 == '  |'
            answer << "1"
        else
            answer << "4"
        end    
    elsif l3 == '|_|'
        if l2 == '| |'
            answer << "0"
        elsif l2 == '|_ '
            answer << "6"
        else
            answer << "8"
        end
    elsif l2 == ' _|'
        if l3 == '|_ '
            answer << "2"
        else
            answer << "3"
        end    
    elsif l3 == ' _|'
        if l2 == '|_|'
            answer << "9"
        else
            answer << "5"
        end    
    else
        answer << "7"
    end
end        
print answer.join
