letter_case = gets.chomp == "true"
letter_fuzz = gets.to_i
number_fuzz = gets.to_i
other_fuzz = gets.chomp == "true"
template = gets.chomp

template = template.downcase unless letter_case
matches = template.scan(/([0-9]+|.)/)
pattern = ""

matches.each do |match|
  char = match[0]
  if char.match?(/[a-zA-Z]/)
    pattern += "["
    if char.match?(/[a-z]/)
      min = 'a'.ord
      max = 'z'.ord
    elsif char.match?(/[A-Z]/)
      min = 'A'.ord
      max = 'Z'.ord
    end
    ([(char.ord - letter_fuzz), min].max..[(char.ord + letter_fuzz), max].min).each do |i|
      pattern += i.chr
    end
    pattern += "]"
  elsif char.match?(/\d/)
    pattern += "("
    ([(char.to_i - number_fuzz), 0].max...[(char.to_i + number_fuzz)].min).each do |i|
      pattern += "#{i}|"
    end
    pattern += "#{char.to_i + number_fuzz})"
  else
    pattern += other_fuzz ? "\\#{char}" : "[^0-9a-zA-Z]"
  end
end

n = gets.to_i
n.times do
  candidate = gets.chomp
  candidate = candidate.downcase unless letter_case
  puts (candidate.match(/^#{pattern}$/) ? "true" : "false")
end