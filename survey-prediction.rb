number_of_inputs = gets.to_i
answers_list, errors_list = [], []

(0...number_of_inputs).each do |index|
  input_line = gets.chomp.split
  if input_line.length == 3
    answers_list << input_line
  else
    errors_list << input_line
  end
end

female_dictionary = {}
male_dictionary = {}
answers_dictionary = {}

answers_list.each do |answer|
  if answer[1] == 'female'
    if female_dictionary.key?(answer[2])
      array_list = female_dictionary[answer[2]]
      array_list << answer[0]
    else
      female_dictionary[answer[2]] = [answer[0]]
    end
  else
    if male_dictionary.key?(answer[2])
      array_list = male_dictionary[answer[2]]
      array_list << answer[0]
    else
      male_dictionary[answer[2]] = [answer[0]]
    end
  end
end

female_dictionary.each do |musician, array_list|
  if array_list.length == 1
    answers_dictionary["#{array_list[0]}female"] = musician
  else
    sorted_list = array_list.sort
    (sorted_list[0].to_i..sorted_list[-1].to_i).each do |i|
      answers_dictionary["#{i}female"] = musician
    end
  end
end

male_dictionary.each do |musician, array_list|
  if array_list.length == 1
    answers_dictionary["#{array_list[0]}male"] = musician
  else
    sorted_list = array_list.sort
    (sorted_list[0].to_i..sorted_list[-1].to_i).each do |i|
      answers_dictionary["#{i}male"] = musician
    end
  end
end

errors_list.each do |error|
  if answers_dictionary.key?(error[0] + error[1])
    puts answers_dictionary[error[0] + error[1]]
  else
    puts "None"
  end
end