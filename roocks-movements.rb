# Initialize the chess board
chess_board = Array.new(8) { Array.new(8, -1) }
rook_position = ''
number_of_pieces = 0

def check_horizontal_left(chess_board, rook_position, index)
  index[0] = 0
  (0...rook_position[0].ord - 97).each do |horizontal_index|
    if chess_board[rook_position[1].ord - '0'.ord - 1][horizontal_index] > -1
      index[0] = chess_board[rook_position[1].ord - '0'.ord - 1][horizontal_index] == 0 ? horizontal_index + 1 : horizontal_index
    end
  end
end

def check_horizontal_right(chess_board, rook_position, index)
  index[0] = 7
  ((rook_position[0].ord - 97 + 1)...8).each do |horizontal_index|
    if chess_board[rook_position[1].ord - '0'.ord - 1][horizontal_index] > -1
      index[0] = chess_board[rook_position[1].ord - '0'.ord - 1][horizontal_index] == 0 ? horizontal_index - 1 : horizontal_index
      break
    end
  end
end

def check_vertical_bottom(chess_board, rook_position, index)
  index[0] = 0
  (0...rook_position[1].ord - '0'.ord - 1).each do |vertical_index|
    if chess_board[vertical_index][rook_position[0].ord - 97] > -1
      index[0] = chess_board[vertical_index][rook_position[0].ord - 97] == 0 ? vertical_index + 1 : vertical_index
    end
  end
end

def check_vertical_top(chess_board, rook_position, index)
  index[0] = 7
  (rook_position[1].ord - '0'.ord...8).each do |vertical_index|
    if chess_board[vertical_index][rook_position[0].ord - 97] > -1
      index[0] = chess_board[vertical_index][rook_position[0].ord - 97] == 0 ? vertical_index - 1 : vertical_index
      break
    end
  end
end

# Main execution
index = [0]
8.times do |i|
  8.times do |j|
    chess_board[i][j] = -1
  end
end

rook_position = gets.chomp
number_of_pieces = gets.to_i
warn "rook Position #{rook_position}"

number_of_pieces.times do
  piece_data = gets.split
  color = piece_data[0].to_i
  one_piece = piece_data[1]
  chess_board[one_piece[1].ord - '0'.ord - 1][one_piece[0].ord - 97] = color
end

values = [-1, 1]
characters = ['-', 'x']
values.each_with_index do |value, cmpt|
  check_horizontal_left(chess_board, rook_position, index)
  (index[0]...rook_position[0].ord - 97).each do |i|
    if chess_board[rook_position[1].ord - '0'.ord - 1][i] == value
      puts "R#{rook_position}#{characters[cmpt]}#{(i + 97).chr}#{rook_position[1].ord - '0'.ord}"
    end
  end

  check_vertical_bottom(chess_board, rook_position, index)
  (index[0]...rook_position[1].ord - '0'.ord - 1).each do |i|
    if chess_board[i][rook_position[0].ord - 97] == value
      puts "R#{rook_position}#{characters[cmpt]}#{rook_position[0]}#{i + 1}"
    end
  end

  check_vertical_top(chess_board, rook_position, index)
  (rook_position[1].ord - '0'.ord..index[0]).each do |i|
    if chess_board[i][rook_position[0].ord - 97] == value
      puts "R#{rook_position}#{characters[cmpt]}#{rook_position[0]}#{i + 1}"
    end
  end

  check_horizontal_right(chess_board, rook_position, index)
  (rook_position[0].ord - 96..index[0]).each do |i|
    if chess_board[rook_position[1].ord - '0'.ord - 1][i] == value
      puts "R#{rook_position}#{characters[cmpt]}#{(i + 97).chr}#{rook_position[1].ord - '0'.ord}"
    end
  end
end