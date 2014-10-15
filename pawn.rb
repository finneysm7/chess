#encoding: utf-8
require './pieces.rb'

class Pawn < Piece
  attr_accessor :has_moved
  def initialize(*args)
    super
    @starting_pos = self.pos
    @has_moved = false
  end
  
  def moves # needs refactoring, too long
    result = []
    pos_move = self.pos.dup
    pos_take = self.pos.dup
    white_take = [[1, 1], [1, -1]]
    black_take = [[-1, -1], [-1, 1]]
    if self.color == :black
      unless self.has_moved
        position1 = [pos_move[0] + 2, pos_move[1]] 
        if @board.in_board?(position1) && board[position1] == nil
          result << position1
        end
      end
      position = [pos_move[0] + 1, pos_move[1]]
      array = white_take
    else
      unless self.has_moved
        position1 = [pos_move[0] - 2, pos_move[1]] 
        if @board.in_board?(position1) && board[position1] == nil
          result << position1
        end
      end
      position = [pos_move[0] - 1, pos_move[1]]
      array = black_take
    end
    if @board.in_board?(position) && board[position] == nil
      result << position
    end
    array.each do |option|
      position = [pos_take[0] + option[0], pos_take[1] + option[1]]
      if board.in_board?(pos_take) && 
        (board[position] != nil && board[position].color != self.color)
        
        result << position
      end
    end 
    result
  end
 
  def display_value
    self.color == :white ? '♙  ' : '♟  ' 
  end
end
