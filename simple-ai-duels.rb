c, d, t, f = 2, 1, 3, 0
x = 12
matrix = {
  "C" => { "C" => [c, c], "D" => [f, t] },
  "D" => { "C" => [t, f], "D" => [d, d] }
}

def next_value(x)
  (137 * x + 187) % 256
end

nb_turns = gets.to_i
ai = {}

n, ai1 = gets.split
ai[ai1] = { "score" => 0, "commands" => [], "actions" => [] }
n = n.to_i
n.times do
  ai[ai1]["commands"] << gets.split
end

m, ai2 = gets.split
ai[ai2] = { "score" => 0, "commands" => [], "actions" => [] }
m = m.to_i
m.times do
  ai[ai2]["commands"] << gets.split
end

def choose(ai, nb_turns, p1, p2)
  ais = { "ME" => p1, "OPP" => p2 }
  opp_ai = { p1 => p2, p2 => p1 }
  ai[p1]["commands"].each do |c|
    if c[0] == "*"
      return c[1]
    elsif c[0] == "START" && nb_turns == 0
      return c[1]
    elsif c[1] == "-1"
      if ai[ais[c[0]]]["actions"][-1] == c[2]
        return c[3]
      end
    elsif c[1] == "WIN"
      if ai[ais[c[0]]]["score"] > ai[opp_ai[ais[c[0]]]]["score"]
        return c[2]
      end
    elsif c[1] == "MAX"
      actions = ai[ais[c[0]]]["actions"]
      if actions.count(c[2]) > actions.length / 2
        return c[3]
      end
    elsif c[1] == "LAST"
      actions = ai[ais[c[0]]]["actions"][0...-c[2].to_i]
      actions = actions.is_a?(Array) ? actions : actions.to_a
      if actions.count(c[3]) > actions.length / 2
        return c[4]
      end
    end
  end
end

nb_turns.times do |i|
  c1 = choose(ai, i, ai1, ai2)
  if c1 == "RAND"
    x = next_value(x)
    c1 = "DC"[(x.to_s(2).count("1") % 2)]
  end
  c2 = choose(ai, i, ai2, ai1)
  if c2 == "RAND"
    x = next_value(x)
    c2 = "DC"[(x.to_s(2).count("1") % 2)]
  end
  ai[ai1]["actions"] << c1
  ai[ai2]["actions"] << c2
  points = matrix[c1][c2]
  ai[ai1]["score"] += points[0]
  ai[ai2]["score"] += points[1]
end

if ai[ai1]["score"] > ai[ai2]["score"]
  puts ai1
elsif ai[ai1]["score"] < ai[ai2]["score"]
  puts ai2
else
  puts "DRAW"
end