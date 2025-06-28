FREQ = {
  "A2" => 110.0000,
  "A4" => 440.0000,
  "B3" => 246.9417,
  "C4" => 261.6256,
  "D3" => 146.8324,
  "E2" => 82.4069,
  "E4" => 329.6276,
  "G3" => 195.9977,
  "G4" => 391.9954
}
STRINGS = {
  "guitar" => ["E4", "B3", "G3", "D3", "A2", "E2"],
  "ukulele" => ["A4", "E4", "C4", "G4"]
}
STEP = 1.05946309436 # 2^(1/12)

mode = gets.chomp

number_of_notes = gets.to_i

number_of_notes.times do
  string, fret = gets.split.map(&:to_i)

  # The frequency of the note we want to play
  frequency = format('%.3f', FREQ[STRINGS[mode][string]] * (STEP ** fret))

  # We want to play on a ukulele
  if mode == "guitar"
    frets = 15
    strings = STRINGS["ukulele"]
  # We want to play on a guitar
  else
    frets = 21
    strings = STRINGS["guitar"]
  end

  answer = []

  strings.each_with_index do |string_name, index|
    base = FREQ[string_name]
    max = format('%.3f', base * (STEP ** frets))

    # We can't play the note on this string
    if frequency.to_f < base || frequency.to_f > max.to_f
      next
    else
      answer << "#{index}/#{(Math.log(frequency.to_f / base) / Math.log(STEP)).round}"
    end
  end

  if answer.any?
    puts answer.join(" ")
  else
    puts "no match"
  end
end