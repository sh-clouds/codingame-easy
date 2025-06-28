digit = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
number_ten = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
tens = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
power_of_ten = ["hundred", "thousand", "million", "billion", "trillion", "quadrillion", "quintillion"]

def group_by_3(n, split)
  reversed_number = n.chars.reverse
  array = []
  split.times do |j|
    str = j * 3 + 2 <= reversed_number.length - 1 ? reversed_number[j * 3 + 2] : "0"
    str += j * 3 + 1 <= reversed_number.length - 1 ? reversed_number[j * 3 + 1] : "0"
    str += reversed_number[j * 3] 
    array.push(str)
  end
  array
end

def get_split(n)
  split = n.length / 3
  split += 1 if n.length % 3 != 0
  split
end

n = gets.to_i
n.times do
  number = gets.chomp
  answer = ""
  if number.to_i.negative?
    answer = "negative "
    number = number[1..-1]
  end
  split = get_split(number) # Number of groups of 3
  array = group_by_3(number, split) # Array containing groups of 3 (starting from the last example: number = 52000 array = ['000', '052'])
  STDERR.puts(array.inspect)
  (split - 1).downto(0) do |j|
    if array[j][0].to_i > 0
      answer += "#{digit[array[j][0].to_i]} #{power_of_ten[0]} "
    end
    if array[j][1].to_i > 0
      if array[j][1].to_i == 1
        answer += "#{number_ten[array[j][2].to_i]} "
      else
        answer += tens[array[j][1].to_i - 2]
        if array[j][2].to_i > 0
          answer += "-#{digit[array[j][2].to_i]} "
        else
          answer += " "
        end
      end
    else
      if array[j][2].to_i > 0 || number.length == 1
        answer += "#{digit[array[j][2].to_i]} "
      end
    end
    if j > 0 && (array[j][2].to_i != 0 || array[j][1].to_i != 0 || array[j][0].to_i != 0)
      answer += "#{power_of_ten[j]} "
    end
  end
  answer = answer.strip
  puts answer
end
