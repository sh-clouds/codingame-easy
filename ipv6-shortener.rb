require 'set'

  # Remove leading zeros by parsing hex values
  input_ips = gets.chomp.split(":")
  ip_addresses = Array.new(8, 0)
  
  (0..7).each do |index|
    ip_addresses[index] = input_ips[index].to_i(16)
  end

  # Turn the numbers back into a string
  new_ip = ""
  ip_addresses.each_with_index do |address, index|
    new_ip += address.to_s(16)
    new_ip += ":" unless index == ip_addresses.length - 1
  end

  # Remove the longest possible zero-only contiguous blocks, from 8 to 2
  (7).downto(1) do |i|
    regex = "(^|:)0" + ":0" * i + "($|:)"
    if new_ip.match?(/(.*)?#{regex}(.*)?/)
      puts new_ip.sub(/:?#{regex}:?/, '::')
      return
    end
  end
  puts new_ip