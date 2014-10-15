

class Game
  attr_accessor :board, :break_loop, :color_turn
  def initialize(board)
    @board = Board.new()
    @break_loop = false
    @color_turn = :white
  end
  
  def play
    self.board.starting_board
    
    until self.board.checkmate?(@color_turn) || @break_loop
      self.board.display
      begin
        input = get_user_input
        @board.move(input[0], input[1], @color_turn)
      rescue => e
        puts e
        retry
      end
        @color_turn == :white ? @color_turn = :black : @color_turn = :white
    end
    game_over_conditions
  end
  
  def get_user_input
    puts "#{color_to_s}'s turn:"
    puts "Enter a position to move from and position to move to separated by a space"
    puts "Traditional chess format: a7 a5 will move the black pawn forward two spaces"
    handle_user_input(gets.chomp)
  end
  
  def handle_user_input(string)
    unless possible_inputs.include?(string) || string = 's'
      raise "Please enter the correct input"
    end
    if string == "fuck you"
      raise "Fuck you too, buddy"
    end
    pos_arr = string.split(' ')
    parse(pos_arr)
  end
  
  def parse(user_input)
    #takes a traditional chess format and makes it work with my code
    parse_arr = %w(a b c d e f g h)
    result = []
    user_input.each do |pos|
      result << [8 - pos[1].to_i, parse_arr.index(pos[0])]
    end
    result
  end
  
  def possible_inputs #generates possible user input
    hori_arr = %w(a b c d e f g h)
    vert_arr = %w(1 2 3 4 5 6 7 8)
    pos_arr = []
    hori_arr.each do |letter|
      vert_arr.each do |num|
        pos_arr << letter + num
      end
    end
    result = []
   # pos_arr1 = pos_arr.dup
    pos_arr.each do |pos|
      pos_arr.each do |pos1|
        result << "#{pos} #{pos1}"
      end
    end
    result
  end
  
  def color_to_s(color = nil)
    if color == nil
      return (@color_turn == :white ? "White" : "Black")
    else
      return (color == :white ? "Black" : "White")
    end 
  end
  
  def game_over_conditions
    self.board.display
    puts "#{color_to_s(@color_turn)} has #{color_to_s} in checkmate"
  end
end