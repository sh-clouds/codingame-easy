N = gets.to_i
names = []
N.times do
  names << gets.strip
end

names.sort! # Sort names alphabetically

index = (N / 2) - 1 # Index of the last name of the first half

# Try to find a magic string shorter than the last name
(0...[names[index].length, names[index + 1].length].min - 1).each do |i|
  # The letters are different, we can create a magic string
  if names[index + 1][i] != names[index][i]
    puts "#{names[index + 1][0...i]}#{(names[index][i].ord + 1).chr}"
    exit
  end
end

puts names[index]
