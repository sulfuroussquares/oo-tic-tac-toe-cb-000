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
  @board[input] = current_player
end

def turn
  puts "Please enter 1-9:"
  @input = input_to_index(gets.strip)
  if valid_move?(input) == true
    #if turn_count(@board) % 2 == 0
      #letter = "X"
      move(input)
     display_board
  #  else
    #  letter = "O"
    #  move(input, letter)
    #  display_board(@board)
  #  end
  else
  puts "Invalid Entry"
  turn
  end
end


def won?
  WIN_COMBINATIONS.detect do |win|
    if win.all?{|index_num| @board[index_num] == "X"}
      win.inspect
    elsif win.all?{|index_num| @board[index_num] == "O"}
      win.inspect
    end
  end
end

def full?
  @board.none? {|space| space == " " || space == nil}
end

def draw?
  won?.nil? && full?
end

def over?
  #Game is over if the game is won OR if the game is a draw
  #Returns False is game is not full and is not won or a draw
  won? || full? || draw?
end

def winner
  if (over? && won?)
    #Returns the value of array "Board" where win condition was met
    return @board[won?[0]]
  end
end

def play
  while (turn_count <= 9) && !over?(board)
  turn(board)
  end
  winner(board)
  if (winner(board) == "X" || winner(board) == "O")
  puts "Congratulations " +winner(board) + "!"
else
  puts "Cat's Game!"
end

end
