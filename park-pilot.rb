n = gets.to_i # Road length
need_length = true
calcul_l_side = []
data = []
car_length = 0
consecutive_r0 = 0
consecutive_l0 = 0
available_space = []

n.times do |i|
  sensor_data = gets.chomp.split("") # Datas from four sensor with values 1 or 0 (e.g 1001)
  data.push({
    FL: sensor_data[0],
    FR: sensor_data[1],
    BR: sensor_data[2],
    BL: sensor_data[3],
  })
  if need_length
    if calcul_l_side.empty?
      if data[i][:FL] == "0"
        calcul_l_side = ["L", i]
      elsif data[i][:FR] == "0"
        calcul_l_side = ["R", i]
      end
    else
      if calcul_l_side[0] == "L"
        if data[i][:BL] == "0"
          car_length = i - calcul_l_side[1] + 1
          need_length = false
        end
      else
        if data[i][:BR] == "0"
          car_length = i - calcul_l_side[1] + 1
          need_length = false
        end
      end
    end
  end
  if data[i][:FL] == "0"
    consecutive_l0 += 1
    if consecutive_l0 == car_length
      available_space.push("#{i + car_length - 1}L") # +car_length-1 for error in exercise
      consecutive_l0 -= 1
    end
  else
    consecutive_l0 = 0
  end
  if data[i][:FR] == "0"
    consecutive_r0 += 1
    if consecutive_r0 == car_length
      available_space.push("#{i + car_length - 1}R") # +car_length-1 for error in exercise
      consecutive_r0 -= 1
    end
  else
    consecutive_r0 = 0
  end
end

puts car_length
available_space.each do |space|
  puts space
end