def pick_option_index(options)
    @seed ||= 0
    @seed += 7
    @seed % options
  end
  
  input_text = gets.strip.split(" ")
  d = gets.to_i
  l = gets.to_i
  s = gets
  
  # Create the lookup table
  lookup = {}
  (0...input_text.length - d).each do |i|
    text = input_text[i, d].join(" ")
  
    if lookup[text].nil? || !lookup[text].include?(input_text[i + d])
      lookup[text] ||= []
      lookup[text] << input_text[i + d]
    end
  end
  
  output = s.split(" ")
  
  # Create the n-gram Markov chain of l length
  i = output.length - d
  while output.length < l
    reference = output[i, d].join(" ")
    output << lookup[reference][pick_option_index(lookup[reference].length)]
    i += 1
  end
  
  puts output.join(" ")