class Graph
  # Define the status constants
  STATUS_OK = 0
  STATUS_IGNORED = 1
  STATUS_ERROR = 2

  Node = Struct.new(:val, :next) do
    def initialize(val)
      super(val, nil)
    end
  end

  def initialize
    @repl = {}
  end

  def insert(from, to)
    return STATUS_IGNORED if from == to

    @repl[to] ||= Node.new(to)
    @repl[from] ||= Node.new(from)

    n_from = @repl[from]
    n_to = @repl[to]

    return STATUS_ERROR unless n_from.next.nil?

    n_from.next = n_to
    integrity_check(n_from)
  end

  def get(from)
    return from unless @repl.key?(from)

    ret = @repl[from]
    ret = ret.next while ret.next
    ret.val
  end

  private

  def integrity_check(node)
    start = node
    cur = node
    return STATUS_ERROR if start.nil?

    while cur.next
      cur = cur.next
      return STATUS_ERROR if cur == start
    end
    STATUS_OK
  end
end

# Main execution
replacements = gets.chomp
multiline = []
n = gets.to_i


while (line = gets)
  multiline << line.chomp
end

graph = Graph.new
replacements.split.each do |cur|
  if cur.size != 2 || graph.insert(cur[0], cur[1]) == Graph::STATUS_ERROR
    puts "ERROR"
    exit(1)
  end
end

multiline.each do |line|
  line.each_char.with_index do |c, index|
    line[index] = graph.get(c)
  end
  puts line
end
