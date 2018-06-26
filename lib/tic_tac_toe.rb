class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

    def input=(input)
    @input = input
  end

  def input
    @input
  end


    def current_player
      turn_count % 2 == 0 ? "X" : "O"
    end

    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6]
]

def input_to_index(input)
  index = (input.to_i) - 1
  return index
end

def valid_move?(index)
  if (index.between?(0,8))
    if (position_taken?(index) == false)
      return true
    end
  end
end


def position_taken?(index)
  if (@board[index] == "" || @board[index] == " " || @board[index] == nil)
    return false
  else
    return true
end
end

def move(input, letter="X")
  @board[input] = letter
end

def turn
  puts "Please enter 1-9:"
  @input = input_to_index(gets.strip)
  if valid_move?(input) == true
    if turn_count(board) % 2 == 0
      letter = "X"
      move(input, letter)
      display_board(board)
    else
      letter = "O"
      move(input, letter)
      display_board(board)
    end
  else
  puts "Invalid Entry"
  turn
  end
end

end
