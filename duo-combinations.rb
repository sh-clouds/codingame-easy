require "set"

def parse_input
  gets.chomp
end

cache = Set.new
total = gets.to_i
alphabet = []

total.times do
  alphabet << parse_input
end

seq = (0...(1 << total)).map { |number| number.to_s(2).rjust(total, '0') }

alphabet.each_cons(2) do |a, b|
  seq.each do |bin|
    entry = bin.gsub('0', a).gsub('1', b)
    unless cache.include?(entry)
      cache.add(entry)
      puts entry
    end
  end
end