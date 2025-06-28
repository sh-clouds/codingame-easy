def getValue(arg)    
    value =  arg.start_with?('$') == true ? $cells[arg[1..].to_i] : arg.to_i
    if value == -1
      return setValue(arg[1..].to_i)
    end
    return value
end  

def setValue(i)
  operation, arg1, arg2 = *$commands[i]
  if operation == 'VALUE'
    $cells[i] = getValue(arg1)
  elsif operation == 'ADD'
    $cells[i] = getValue(arg1) + getValue(arg2)
  elsif operation == 'SUB'
    $cells[i] = getValue(arg1) - getValue(arg2)
  elsif operation == 'MULT'
    $cells[i] = getValue(arg1) * getValue(arg2)
  end 
  return $cells[i]
end 

n = gets.to_i
$commands, $cells = [], []
$cells = [-1] * n

n.times do
  $commands.push(gets.split)
end

0.upto(n-1) do |i|    
  puts setValue(i)
end

