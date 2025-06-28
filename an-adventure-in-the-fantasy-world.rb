require 'set'

def read_string
  gets.chomp
end

NodeType = Struct.new(:type, :value)


infos = {}
path = read_string

pos = [0, 0]
gold = 50
fought = nil

read_string.to_i.times do
  info = read_string
  parts = info.split
  key = [parts[0].to_i, parts[1].to_i]
  infos[key] = if parts[2] == "enemy"
                  NodeType.new(:enemy, parts[3])
                else
                  NodeType.new(:money, parts[3].gsub("G", "").to_i)
                end
end

path.each_char do |x|
  case x
  when 'U'
    pos[0] -= 1
  when 'D'
    pos[0] += 1
  when 'R'
    pos[1] += 1
  else
    pos[1] -= 1
  end

  if node = infos[pos]
    case node.type
    when :enemy
      name = node.value
      if name == "goblin"
        if gold < 50
          fought = name
          break
        end
        gold -= 50
      else
        fought = name
        break
      end
    when :money
      gold += node.value
      infos.delete(pos)
    end
  end
end

if fought
  puts "#{pos[0]} #{pos[1]} #{gold}G #{fought}"
else
  puts "GameClear #{pos[0]} #{pos[1]} #{gold}G"
end
