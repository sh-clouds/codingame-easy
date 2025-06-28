def sorting(arrs)
  (1..3).each do |i|
    arrs.sort_by! { |x| -x[i].to_i }
  end
  arrs.each do |arr|
    arr[1] = "#{arr[1][0..1]}:#{arr[1][2..-1]}"
    arr[3] = arr[3].gsub("0", "none").gsub("1", "Followed").gsub("2", "Pinned")
  end
  arrs
end

comments = []
replies = {}
replie = ""
n = gets.to_i
n.times do
  comment = gets.chomp.gsub("Pinned", "2").gsub("Followed", "1").gsub("none", "0")
  replie = comment.start_with?("    ") ? comments.last[0] : ""
  comment = comment.split("|")
  comment[1] = comment[1].gsub(":", "")
  if replie != ""
    if replies.key?(replie)
      replies[replie] << comment
    else
      replies[replie] = [comment]
    end
  else
    comments << comment
  end
end

replies.each do |key, value|
  replies[key] = sorting(value)
end
comments = sorting(comments)
comments.each do |line|
  puts line.join("|")
  if replies.key?(line[0])
    replies[line[0]].each do |line0|
      puts line0.join("|")
    end
  end
end