n = gets.to_i

n.times do
  line = gets.chomp
  l_result = 0
  j = 0

  while j<line.size do
    if line[j] == 'f' 
       l_result += 1
       j+=2
    end
    j+=1  
  end
  
  puts l_result
end
