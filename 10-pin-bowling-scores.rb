def get_scores(frames)
  scores = Array.new(10, 0)
  next_balls_to_add = Array.new(10, 0)

  add_to_previous = lambda do |frame, score|
    (frame - 2...frame).each do |i|
      if i >= 0 && next_balls_to_add[i] > 0
        scores[i] += score
        next_balls_to_add[i] -= 1
      end
    end
  end

  frames.each_with_index do |frame, i|
    frame.each_char do |pins|
      score, next_balls = get_result(pins, scores[i])
      add_to_previous.call(i, score)
      next_balls_to_add[i] = next_balls
      scores[i] += score
    end
  end

  (1...scores.length).each do |i|
    scores[i] += scores[i - 1]
  end

  scores
end

def get_result(pins, score)
  case pins
  when 'X'
    [10, 2]
  when '/'
    [10 - (score % 10), 1]
  when '-'
    [0, 0]
  else
    [pins.to_i, 0]
  end
end

n = gets.to_i

n.times do
  frames = gets.split
  puts get_scores(frames).join(" ")
end
