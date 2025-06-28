# Create Hashmap with item name : array of item costs.
items = {}
item_count = gets.to_i
customer_count = gets.to_i
(0...item_count).each do
  item = gets.split
  name = item[0..-2].join(" ")
  cost = item[-1]
  items[name] ||= []
  items[name] << cost
end

# Check each customer request and print cheapest cost if found else NONE
(0...customer_count).each do
  item = gets.chomp
  min_cost = "X"
  # If item is valid then get minimum cost.
  if items.key?(item)
    costs = items[item]
    min_cost = costs.min
    # Remove item by setting to X
    items[item][costs.index(min_cost)] = "X"
  end
  
  # Print correct result
  if min_cost != "X"
    puts min_cost
  else
    puts "NONE"
  end
end
