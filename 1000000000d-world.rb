a = gets.chomp.split(" ");
b = gets.chomp.split(" ");

_a, __a, _b, __b, sum = 0, 0, 0, 0, 0

while !(a.length == 0 && b.length == 0) do
  if _a == 0
    _a = a.shift().to_i;
    __a = a.shift().to_i;
  end
  if _b == 0
    _b = b.shift().to_i;
    __b = b.shift().to_i;
  end
  min = _a > _b ? _b : _a
  _a -= min
  _b -= min
  sum += __a * __b * min
end

puts sum
