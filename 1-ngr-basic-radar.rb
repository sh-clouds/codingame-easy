class Radar
  attr_accessor :plate, :radarname, :time
  def initialize(plate, radarname, time)
      self.plate = plate
      self.radarname = radarname
      self.time = time      
  end
end 

n = gets.to_i
listPlate = []

n.times do
  plate, radarname, timestamp = gets.split
  timestamp = timestamp.to_i
  listPlate.push(Radar.new(plate, radarname, timestamp))
end

listPlate = listPlate.sort_by { |radar| radar.plate }

i = 0
while i<listPlate.size do
  radar1 = listPlate[i]
  radar2 = listPlate[i + 1]
  vitesse = (13.to_f / (radar2.time.to_f / 1000 / 60 / 60 - radar1.time.to_f / 1000 / 60 / 60)).round
  if vitesse > 130
    puts "#{radar1.plate} #{vitesse}"  
  end    
  i += 2    
end


# other
gets.to_i.times.map {
  plate, _, timestamp = gets.split
  [plate, timestamp.to_i]
}.sort.each_slice(2) {
  s = 13.0 * 1000 * 3600 / (_2[1] - _1[1])
  puts "#{_1[0]} #{s.to_i}" if s > 130
}