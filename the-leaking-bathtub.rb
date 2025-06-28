leaks = []

S = gets.to_i
h = gets.to_i
flow = gets.to_i
n = gets.to_i
n.times do
  leak_height, leak_flow = gets.split.map(&:to_i)
  leaks << [leak_height, leak_flow]
end

# Sort leaks from bottom to top
leaks.sort_by! { |leak| leak[0] }

leaks << [h, 0] # Sets the top as a leak

height = 0
time = 0.0

leaks.each do |leak_height, leak_flow|
  time += ((leak_height - height) * S * 0.001) / flow # The time it takes to fill from current height up to the start of the leak

  if (flow -= leak_flow) <= 0
    print ("Impossible, #{leak_height} cm.") #The flow decrease by leak flow
    exit  
  end

  height = leak_height
end

puts format("%02d:%02d:%02d", (time / 60).to_i, (time % 60).to_i, (60 * (time - time.to_i)).floor)