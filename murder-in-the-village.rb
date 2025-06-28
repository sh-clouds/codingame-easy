require 'set'

INFO_RE = /(\w+): I was in the (\w+)(,| with) (\w+( and \w+)*)/
alibi = {}
(0...gets.to_i).each do
  name, place, _, others, _ = INFO_RE.match(gets).captures
  witness = others != 'alone' ? Set.new(others.split(' and ')) : Set.new
  alibi[name] = [place, witness]
end

innocent = Set.new
alibi.each do |name, (place, witness)|
  unless innocent.include?(name)
    if witness.any?
      witness_name = witness.to_a.sample
      place1, witness1 = alibi[witness_name]
      if Set.new([name, place] + witness.to_a) != Set.new([witness_name, place1] + witness1.to_a)
        puts "#{name} did it!"  # claimed to be with someone who does not confirm
        exit 
      end
      innocent.merge([name] + witness.to_a)
    elsif innocent.any? { |n| alibi[n][0] == place }
      puts "#{name} did it!"  # claimed to be alone where an innocent was
      exit
    end
  end
end
puts "It was me!"