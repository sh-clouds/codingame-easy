work_time = gets.to_i
num_clients = gets.to_i
efficiency = gets.split.map(&:to_f)
num_help_times = gets.to_i
help_times = gets.split.map(&:to_i)

helped_clients = Array.new(num_clients, 0)
breaks = Array.new(num_clients, 0)
working_time = Array.new(num_clients, 0.0)
time_remaining = Array.new(num_clients, 0.0)

loop do
  min_time = time_remaining.min
  time_remaining.map! { |t| t - min_time - 0.001 }

  (0...num_clients).each do |i|
    if time_remaining[i] < 0 && working_time[i] < work_time
      helped_clients[i] += 1
      time_needed = help_times.shift.to_f / efficiency[i]
      working_time[i] += time_needed
      time_remaining[i] += time_needed

      if help_times.empty?
        puts helped_clients.join(" ")
        puts breaks.join(" ")
        exit
      end
    end
  end

  (0...num_clients).each do |i|
    if time_remaining[i] < 0
      working_time[i] = 0
      breaks[i] += 1
      time_remaining[i] += 10
    end
  end
end