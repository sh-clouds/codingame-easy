require 'set'

w, h, count_x, count_y = gets.split.map(&:to_i)
measureX = gets.split.map(&:to_i)
measureY = gets.split.map(&:to_i)

def merge_dict(dict1, dict2)
  dict3 = dict1.merge(dict2) { |key, old_val, new_val| old_val + new_val }
  dict3
end

def count_unique(cuts_list)
  unique = cuts_list.to_set
  result = {}
  unique.each do |i|
    result[i] = cuts_list.count(i)
  end
  result
end

def get_cuts(length, measures)
  list_length = measures.length
  temp_list = []
  if list_length > 1
    temp_list = (0...list_length).map { |i| measures[-1] - measures[i] }.select { |cut| cut > 0 }
  end
  temp_list << measures[-1]
  cut = length - measures[-1]
  temp_list << cut if cut > 0
  count_unique(temp_list)
end

def get_cut_list(cuts_list, length, measures)
  (1..measures.length).each do |i|
    cuts_list = merge_dict(cuts_list, get_cuts(length, measures[0...i]))
  end
  cuts_list[length] = cuts_list.fetch(length, 0) + 1
  cuts_list
end

def count_totals(dict_x, dict_y)
  result = 0
  smaller, bigger = dict_x.length >= dict_y.length ? [dict_y, dict_x] : [dict_x, dict_y]
  smaller.each do |key, value|
    result += bigger.fetch(key, 0) * value
  end
  result
end

cuts_x = get_cut_list({}, w, measureX)
cuts_y = get_cut_list({}, h, measureY)

puts count_totals(cuts_x, cuts_y)

