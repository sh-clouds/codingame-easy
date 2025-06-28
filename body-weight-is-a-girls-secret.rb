measures = gets.chomp.split(' ').map { |x| x.to_i rescue 0 }
total_sum = measures.sum / 4

measures.combination(3) do |m|
  pa = (m[0] + m[1] - m[2]) / 2
  pb = (m[0] + m[2] - m[1]) / 2
  pc = (m[1] + m[2] - m[0]) / 2

  next if pa <= 0 || pb <= 0 || pc <= 0

  measures.each do |measure|
    pd = measure - pa
    pe = total_sum - (pa + pb + pc) - pd

    next if pd <= 0 || pe <= 0

    expected = [
      pa + pb, pa + pc, pa + pd, pa + pe, pb + pc,
      pb + pd, pb + pe, pc + pd, pc + pe, pd + pe,
    ]
    expected.sort!

    if expected == measures
      puts "#{pa} #{pb} #{pc} #{pd} #{pe}"
      return
    end
  end
end
