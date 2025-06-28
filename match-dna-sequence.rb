delta = gets.to_i
gene = gets.chomp

n = gets.to_i
(0...n).each do |s|
  sequence = gets.chomp

  # Gene can only overflow at the end
  (0..(sequence.length - gene.length + delta)).each do |i|
    differences = 0

    (0...gene.length).each do |j|
      # Mismatch gene/sequence or overflow
      if (i + j >= sequence.length || sequence[i + j] != gene[j])
        differences += 1
      end
      break if differences > delta
    end

    # Gene has been found
    if differences <= delta
      puts "#{s} #{i} #{differences}"
      exit
    end
  end
end

puts "NONE"