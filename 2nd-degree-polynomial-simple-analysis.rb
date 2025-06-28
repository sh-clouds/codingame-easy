class Pt
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  def get
    return @x.round(2), @y.round(2)
  end  
end

a, b, c = gets.split.map(&:to_f)
res = []

res.push(Pt.new(0, c))
if a.zero?
  if b.zero?
    res.push(Pt.new(0, c))
  else
    res.push(Pt.new(-c / b, 0))
  end
else
  delta = b**2 - 4 * a * c
  if delta >= 0  
    x1 = (-b - Math.sqrt(delta)) / (2 * a)
    x2 = (-b + Math.sqrt(delta)) / (2 * a)
    res.push(Pt.new(x1, a * x1**2 + b * x1 + c))
    res.push(Pt.new(x2, a * x2**2 + b * x2 + c))
  end
end

a = res.map(&:get)
a.sort!

b=[]
a.each do |i|
    c = []
    i.each do |j|
      d = 0
      if j == j.to_i
        d = j.to_i
      elsif j*10 == (j*10).to_i
        d = j.round(1)    
      else
        d = j.round(2)     
      end              
      c.push(d)
    end        
    b.push(c)
end    

c = []
b.each do |i|
    if c.include?(i) == false
        c.push(i)
    end
end         

0.upto(c.size-1) do |i|
    print "(" + c[i].join(",") + ")"
    if i<c.size-1
        print ","
    end    
end