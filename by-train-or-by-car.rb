start, stop = gets.split(" ")
n = gets.to_i
distance_data = {}
car_time = 0.0
train_time = 57.0

n.times do
  dep, arr, dist = gets.split
  distance_data[dep] = [arr, dist.to_f]
end

while start != stop
  start, distance = distance_data[start]
  train_time += [distance.to_f, 6].min * 60.0 / 50 + [0, distance.to_f - 6].max * 60.0 / 284 + 8
  car_time += [distance.to_f, 14].min * 60.0 / 50 + [0, distance.to_f - 14].max * 60.0 / 105
end

hour = [train_time, car_time].min / 60
minutes = [train_time, car_time].min % 60
puts (train_time < car_time ? "TRAIN" : "CAR") + sprintf(" %d:%02d", hour.to_i, minutes.to_i)