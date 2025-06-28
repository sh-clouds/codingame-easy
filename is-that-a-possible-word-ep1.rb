class State
  def initialize(name = ' ')
    @name = name
    @links = {}
  end

  def add_link(key, state)
    @links[key] = state
  end

  def name
    @name
  end

  def next_state(key)
    @links.key?(key) ? @links[key] : nil
  end

  def ==(other)
    @name == other.name
  end
end

states = {}
alpha_str = gets.chomp
states_str = gets.chomp

states_str.each_char do |char|
  states[char] = State.new(char) unless char == ' '
end

nb_trans = gets.to_i

nb_trans.times do
  trans_str = gets.chomp
  c1 = trans_str[0]
  c2 = trans_str[4]
  link = trans_str[2]

  if states.key?(c1) && states.key?(c2)
    states[c1].add_link(link, states[c2])
  end
end

str_state_str = gets.chomp
end_state_str = gets.chomp

nb_words = gets.to_i

nb_words.times do
  word_str = gets.chomp
  is_ok = true
  cur_state = states[str_state_str[0]]

  word_str.each_char do |char|
    cur_state = cur_state.next_state(char)
    if cur_state.nil?
      is_ok = false
      break
    end
  end
  
  puts (is_ok && end_state_str.include?(cur_state.name)) ? "true" : "false"
end