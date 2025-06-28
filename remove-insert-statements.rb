skip = false
body = false

N = gets.to_i
N.times do
  matches = gets.scan(/[^;]+(?:;\n?|$)/)

  matches.each do |match|
    if match.strip.downcase.start_with?("begin")
      body = true # Start body of function
    end
    if match.strip.downcase.start_with?("end")
      body = false # End body of function
    end
    if !body && match =~ /^\s?insert\s/i
      skip = true # Start of normal insert statement
    end

    print match unless skip

    if skip && match.include?(";")
      skip = false # End of insert statement
    end
  end
end


