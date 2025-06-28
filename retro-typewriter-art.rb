t="15sp 1O 1o 1* 1o 1O 1o 1O 1o nl 10sp 1o 1O 1o 1O 1* 1O 1o 1* 1o 1O 1o 1O 1o 1O 1o 1O 1@ 1o nl 8sp 1o 1O 1o 1O 1o 1O 18 1O 1o 1O 1@ 1o 1@ 1o 1O 1o 1O 1o 1O 1o nl 8sp 1o 1O 1o 1O 1@ 1O 1o 18 1o 1O 2o 1@ 1o 1O 1o 18 1@ 1O 1o 1O nl 7sp 2o 1O 1o 18 1o 1O 1o 1O 1o 1O 1@ 20 1O 1o 1O 1* 1O 1o 1O 1o 1O 1o nl 4sp 2o 1O 1o 1O 1o 1O 1@ 1O 1o 1O 1o 1O 1o 10 1o 1O 1@ 1O 1o 1O 1o 1O 1o 1O 1@ 1O 1o nl 2sp 2o 1O 1o 18 1o 1O 1o 1O 1o 1O 1o 1O 1@ 1O 1* 2o 1O 1o 18 1o 1O 1@ 1O 1o 1O 1o 1O 1o 1O 1o nl 2sp 1o 1O 1o 1O 1o 1O 1o 1* 18 1O 1o 1O 1o 1O 1o 1O 1o 1O 18 1O 1o 1O 1o 1O 1o 1O 1o 18 1o 1O 1o 1O nl 2sp 1* 2o 1O 2o 1O 2o 1O 2o 1O 2o 1@ 1* 2o 1O 2o 1O 18 1o 1O 2o 1O 2o 1* nl 6sp 1O 2sp 1* 2o 1O 1sp 1x 1sp 4X 1* 1O 1o 1* 2sp 1@ 2sp 1* 1o nl 11sp 1O 1o 2sp 1x 4X 1* 2o nl 16sp 2X 1@ 1X 1x nl 16sp 4X nl 16sp 4X nl 15sp 1x 5X 1x nl 13sp 1x 8X 1x nl 9sp 16X 1x nl 35="
answer = ""

t = t.split(" ")

def test_abb(s)
  case s
  when "sp"
    return " "
  when "bS"
    return "\\"
  when "sQ"
    return "'"
  else
    return s
  end
end

# puts test_abb("sp")
# puts test_abb("bS")
# puts test_abb("sQ")
# puts test_abb("o")

t.each do |chunk|
  if chunk == "nl"
    answer += "\n"
  elsif chunk[-1].to_i.positive? || chunk[-1] == "0"
    digit = chunk[0..chunk.length - 2].to_i
    chunk = chunk[-1]
    answer += chunk * digit
  elsif chunk[0].to_i.positive?
    if chunk[1].to_i.positive? || chunk[1] == "0"
      digit = chunk[0..1].to_i
      chunk.slice!(0..1)
    else
      digit = chunk[0].to_i
      chunk.slice!(0)
    end
    answer += test_abb(chunk) * digit
  end
end
puts answer
