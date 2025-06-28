class Timestamp
  attr_reader :minutes, :seconds

  def initialize(minutes, seconds)
    raise "Seconds must be between 0 and 59" if seconds > 59

    @minutes = minutes
    @seconds = seconds
  end

  def as_seconds
    @minutes * 60 + @seconds
  end

  def self.from_seconds(seconds)
    return Timestamp.new(0, 0) if seconds <= 0

    minutes = (seconds / 60).to_i
    seconds = (seconds % 60).to_i

    Timestamp.new(minutes, seconds)
  end

  def self.from_string(string)
    parts = string.split(':')
    
    raise "Invalid format." unless parts.length == 2

    minutes = parts[0].to_i
    seconds = parts[1].to_i

    Timestamp.new(minutes, seconds)
  end

  def to_s
    "#{@minutes}:#{sprintf('%02d', @seconds)}"
  end

  include Comparable

  def <=>(other)
    as_seconds <=> other.as_seconds
  end
end

def read_int
  gets.strip.to_i
end

def read_timestamp
  input_line = gets.strip
  Timestamp.from_string(input_line)
rescue
  Timestamp.new(0, 0)
end


t_stop = Timestamp.new(0, 0)
players = 1

read_int.times do |i|
  t_cur = read_timestamp

  break if t_cur < t_stop

  if i == 6
    t_stop = t_cur
    break
  end

  t_stop = Timestamp.from_seconds(t_cur.as_seconds - (256 / (2 ** i)))
  players += 1
end

puts players == 1 ? "NO GAME" : t_stop.to_s
