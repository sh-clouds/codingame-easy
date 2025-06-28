class Tribute
  def initialize(name)
    @name = name
    @killed = []
    @killer = nil
  end

  def set_kill(name)
    @killed << name
  end

  def set_killer(name)
    @killer = name
  end

  def get_message
    killed_list = @killed.empty? ? "None" : @killed.sort.join(", ")
    killer_name = @killer.nil? ? "Winner" : @killer
    return "Name: #{@name}\nKilled: #{killed_list}\nKiller: #{killer_name}"
  end
end

tribes = gets.to_i
players = {}

tribes.times do
  player_name = gets.chomp
  players[player_name] = Tribute.new(player_name)
end

gets.to_i.times do
  input_line = gets.chomp.split(" killed ")
  input_line[1].split(", ").each do |victim|
    players[input_line[0]].set_kill(victim)
    players[victim].set_killer(input_line[0])
  end
end

puts players.keys.sort.map { |key| players[key].get_message }.join("\n\n")