m = gets.to_i

m.times do
  parts = gets.chomp.strip.split("/")

  ip = parts[0]
  cidr = parts[1].to_i
  var_part = 32 - cidr

  ip_bins = ip.split('.').map { |s| format("%08b", s.to_i) }
  ip_bin_str = ip_bins.join("")

  if var_part == 0
    puts "valid 1"
  else
    var_part_str = ip_bin_str[-var_part..-1]
    if var_part_str.chars.all? { |c| c == '0' }
      puts "valid #{2**var_part}"
    else
      var_part_count = ip_bin_str.chars.reverse.take_while { |c| c == '0' }.count
      cidr = 32 - var_part_count
      puts "invalid #{ip}/#{cidr} #{2**var_part_count}"
    end
  end
end