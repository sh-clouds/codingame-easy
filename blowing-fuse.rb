inputs = gets.chomp.split
number_of_devices = inputs[0].to_i # Nb appareils
number_of_clicks = inputs[1].to_i # Nb de click qui vont ce produire
fuse_capacity = inputs[2].to_i # Capacité du fusible
current_amperage = 0
max_amperage = 0
device_list = []
inputs = gets.chomp.split

number_of_devices.times do |index|
  device_list.push({ ampere: inputs[index].to_i, state: false })
end

inputs = gets.chomp.split

number_of_clicks.times do |index|
  device_index = inputs[index].to_i - 1
  device_list[device_index][:state] = !device_list[device_index][:state]
  current_amperage += device_list[device_index][:state] ? device_list[device_index][:ampere] : -device_list[device_index][:ampere]
  max_amperage = [max_amperage, current_amperage].max
end

if max_amperage > fuse_capacity
  puts "Fuse was blown."
else
  puts "Fuse was not blown.\nMaximal consumed current was #{max_amperage} A."
end