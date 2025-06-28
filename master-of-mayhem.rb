cyborg_count = gets.to_i
cyborgs = []

cyborg_count.times do
  cyborgs << gets.chomp
end

cyborgs = cyborgs.uniq

mayhem_report_count = gets.to_i
info = {}

mayhem_report_count.times do
  mayhem_report = gets.chomp
  matches = mayhem_report.gsub('"', '').match(/Mayhem's ([a-z]+) is (?:an |a )?([a-zA-Z ]+)/)

  if matches
    info[matches[1]] = matches[2]
  end
end

cyborg_report_count = gets.to_i

cyborg_report_count.times do
  cyborg_report = gets.chomp
  matches = cyborg_report.gsub('"', '').match(/([a-zA-Z]+)'s ([a-z]+) is (?:an |a )?([a-zA-Z ]+)/)

  if matches
    name = matches[1]
    attribute = matches[2]
    type = matches[3]

    # We have already eliminated this cyborg
    next unless cyborgs.include?(name)

    # Making sure the catchphrase contains the word
    if attribute == "catchphrase" && info.key?("word") && type !~ /\b#{info["word"]}\b/
      cyborgs.delete(name)
    # Making sure the attribute is the same
    elsif info.key?(attribute) && type != info[attribute]
      cyborgs.delete(name)
    end
  end
end

if cyborgs.empty?
  puts "MISSING"
elsif cyborgs.size > 1
  puts "INDETERMINATE"
else
  puts cyborgs.first
end