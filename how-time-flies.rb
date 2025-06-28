require 'date'

start_date = gets.chomp.split('.')
end_date = gets.chomp.split('.')
year_difference = end_date[2].to_i - start_date[2].to_i
month_difference = end_date[1].to_i - start_date[1].to_i
day_difference = end_date[0].to_i - start_date[0].to_i
result = ""

if month_difference < 0
  year_difference -= 1
  month_difference += 12
end

if day_difference < 0
  month_difference -= 1
  day_difference = 31 + month_difference
end

if year_difference > 0
  if year_difference == 1
    result = "1 year, "
  else
    result = "#{year_difference} years, "
  end
end

if month_difference > 0
  if month_difference == 1
    result += "1 month, "
  else
    result += "#{month_difference} months, "
  end
end

start_datetime = Date.strptime("#{start_date[1]}.#{start_date[0]}.#{start_date[2]}", '%m.%d.%Y')
end_datetime = Date.strptime("#{end_date[1]}.#{end_date[0]}.#{end_date[2]}", '%m.%d.%Y')
date_difference_in_days = (end_datetime - start_datetime).to_i

puts "#{result}total #{date_difference_in_days} days"