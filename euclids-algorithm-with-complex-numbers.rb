# Read input values
xa, ya = gets.split.map(&:to_i)
xb, yb = gets.split.map(&:to_i)

def format_complex(x, y)
  if x == 0
    "#{y}j"
  else
    "(#{x}#{y >= 0 ? '+' : ''}#{y}j)"
  end
end

# If there are two possible choices pick the highest one
def round_number(number)
  if number > 0
    number.round(0, half: :up)
  else
    number.round(0, half: :down)
  end
end

def solve(xa, ya, xb, yb)
  # a/b => (a + i.b) / (a' + i.b') = (aa' + bb') + i (ba' - ab') / (a'² + b'²)
  xq = round_number((xa * xb + ya * yb).to_f / (xb**2 + yb**2))
  yq = round_number((ya * xb - xa * yb).to_f / (xb**2 + yb**2))

  # q * b => (a + i.b) x (a' + i.b') = (aa' – bb') + i (ab' + ba')
  xr = xq * xb - yq * yb
  yr = xq * yb + yq * xb

  # a - (q * b) => (a + i.b) – (a' + i.b') = a – a' + i (b – b')
  xr = xa - xr
  yr = ya - yr

  puts "#{format_complex(xa, ya)} = #{format_complex(xb, yb)} * #{format_complex(xq, yq)} + #{format_complex(xr, yr)}"

  # If rest is 0 we are done otherwise get the GCD of b & r
  if xr == 0 && yr == 0
    format_complex(xb, yb)
  else
    solve(xb, yb, xr, yr)
  end
end

puts "GCD(#{format_complex(xa, ya)}, #{format_complex(xb, yb)}) = #{solve(xa, ya, xb, yb)}"