class MSquare
    def initialize(input)
      @state = 0
      3.times do |i|
        line = input.gets.chomp
        next if line.size < 5
  
        cells_to_set = []
        3.times do |component|
          cells_to_set << (3 * i + component + 1) if line[2 * component] == '*'
        end
        set_list(cells_to_set)
      end
    end
  
    def toggle(cell)
      new_square = Marshal.load(Marshal.dump(self)) # Deep copy
      
      case cell
      when 1
        new_square.toggle_list([1, 2, 4, 5])
      when 2
        new_square.toggle_list([1, 2, 3])
      when 3
        new_square.toggle_list([2, 3, 5, 6])
      when 4
        new_square.toggle_list([1, 4, 7])
      when 5
        new_square.toggle_list([2, 4, 5, 6, 8])
      when 6
        new_square.toggle_list([3, 6, 9])
      when 7
        new_square.toggle_list([4, 5, 7, 8])
      when 8
        new_square.toggle_list([7, 8, 9])
      when 9
        new_square.toggle_list([5, 6, 8, 9])
      end
      new_square
    end
  
    def toggle_multiple(cells)
      new_square = Marshal.load(Marshal.dump(self))
      cells.each_char do |char|
        if char =~ /\d/
          new_square = new_square.toggle(char.to_i)
        end
      end
      new_square
    end
  
    def solved?
      0x1EF == (@state & 0x1EF)
    end
  
    protected
  
    def toggle_list(cells)
      cells.each do |cell|
        @state ^= 1 << (cell - 1)
      end
    end
  
    def set_list(cells)
      cells.each do |cell|
        @state |= 1 << (cell - 1)
      end
    end
end
  
# Main program
return_value = 1
buttons_pressed = ""
game = MSquare.new(ARGF)

buttons_pressed = gets.chomp
game = game.toggle_multiple(buttons_pressed)

while return_value < 10
    next_game = game.toggle(return_value)
    break if next_game.solved?
    return_value += 1
end

puts return_value