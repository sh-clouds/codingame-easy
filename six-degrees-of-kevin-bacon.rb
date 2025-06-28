require 'set'

class Node
  attr_accessor :neighbours

  def initialize
    @neighbours = Set.new
  end
end

class Graph
  def initialize
    @nodes = {}
  end

  def insert(actor_name)
    return @nodes[actor_name] if @nodes.key?(actor_name)

    @nodes[actor_name] = Node.new
  end

  def process(input_str)
    pos = input_str.index(':')
    input_str = input_str[(pos + 1)..-1] if pos

    current_actors = Set.new
    input_str.split(',').each do |token|
      current_actors.add(insert(token.strip))
    end

    current_actors.each do |current_actor|
      current_actors.each do |co_actor|
        current_actor.neighbours.add(co_actor) unless co_actor == current_actor
      end
    end
  end

  def get_by_name(actor_name)
    @nodes[actor_name] || nil
  end
end

actor_name = gets.chomp
n = gets.to_i
graph = Graph.new

n.times do
  movie_cast = gets.chomp
  graph.process(movie_cast)
end

current_actor = graph.get_by_name(actor_name)
target_actor = graph.get_by_name("Kevin Bacon")
queue = [current_actor]
memory = { current_actor => 1 }

if current_actor == target_actor
  puts 0
  exit(0)
end

until queue.empty?
  current_actor = queue.shift

  if current_actor.neighbours.include?(target_actor)
    puts memory[current_actor]
    exit(0)
  end

  current_actor.neighbours.each do |neighbour|
    next if memory.key?(neighbour)

    memory[neighbour] = memory[current_actor] + 1
    queue.push(neighbour)
  end
end
