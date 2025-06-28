# Read the number of wirings from standard input
number_of_wirings = gets.to_i
wiring = []
number_of_wirings.times do
  wiring << gets.strip
end

# Read the number of switches from standard input
number_of_switches = gets.to_i
switches = Hash.new(0)
number_of_switches.times do
  switch = gets.strip
  switches[switch] ^= 1
end

wiring.each do |string|
  matches = string.match(/([^ ]+) (.*)/)
  name = matches[1]
  info = matches[2]

  sequences = info.split(/([-=] )/).reject(&:empty?)

  status = 1

  # Check each sequence leading to this equipment
  sequences.each_slice(2) do |sequence|
    local = sequence[0][0] == "-" ? 1 : 0 # Series starts ON, parallel starts as OFF

    # Check each switch in the sequence
    sequence[1].strip.split.each do |switch|
      if sequence[0][0] == "-"
        local &= switches[switch]
      else
        local |= switches[switch]
      end
    end

    status &= local
  end

  puts "#{name} is #{status == 1 ? 'ON' : 'OFF'}"
end