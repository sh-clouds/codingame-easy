N = gets.to_i
N.times do
  character_groups = []
  input_line = gets.chomp
  input_line.each_char do |character|
    is_added = false
    if character_groups.empty?
      character_groups.push([character])
      is_added = true
    end
    character_groups.each do |group|
      if character.ord <= group.last.ord && !is_added
        group.push(character)
        is_added = true
        break
      end
    end
    character_groups.push([character]) unless is_added
  end
  puts character_groups.length
end