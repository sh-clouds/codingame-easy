s, m = gets.chomp.split.map(&:to_i)
max_clients = gets.chomp.split.map(&:to_i).map(&:to_i)
services = Array.new(s, 0)

m.times do
  clients = gets.chomp.split.map(&:to_i)
  answer = []

  clients.each_with_index do |count, index|
    instance = (count.to_f / max_clients[index]).ceil

    answer << (instance - services[index])
    services[index] = instance
  end

  puts answer.join(" ")
end