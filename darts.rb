class Score
  attr_accessor :name, :sc, :pos

  def initialize(name = "", sc = 0, pos = 0)
    @name = name
    @sc = sc
    @pos = pos
  end
end

def sort_by_players(a, b)
  if a.sc == b.sc
    a.pos < b.pos
  else
    a.sc > b.sc
  end
end

w = gets.to_i
n = gets.to_i
v = []

n.times do |i|
  name = gets.chomp
  v.push(Score.new(name, 0, i))
end

t = gets.to_i

t.times do
  throw_name, x, y = gets.split
  x = x.to_i
  y = y.to_i
  it = v.find { |obj| obj.name == throw_name }
  
  if (x.abs <= w / 2) && (y.abs <= w / 2)
    if (x.abs + y.abs) <= w / 2
      it.sc += 15
    elsif Math.sqrt(x**2 + y**2) <= w / 2
      it.sc += 10
    else
      it.sc += 5
    end
  end
end

v.sort_by! { |score| [-score.sc, score.pos] }
v.each { |i| puts "#{i.name} #{i.sc}" }



