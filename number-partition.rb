def print_combinations(n, k, current_combination)
    if n == 0
        result = current_combination.join(' ')
        puts result
    else
        (k).downto(1) do |i|
        new_combination = current_combination.dup
        new_combination << i
        print_combinations(n - i, [n - i, i].min, new_combination)
        end
    end
end
  
n = gets.to_i
print_combinations(n, n, [])