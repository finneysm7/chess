#encoding: utf-8
class Piece
  attr_accessor :pos, :color, :board
  def initialize(pos, color, board)
    @pos = pos
    @color = color
    @board = board
    @board[pos] = self
  end
  
  def moves
    raise "Not implemented yet"
  end
  
  def valid_moves
    val_moves = []
    self.moves.each do |move|
      val_moves << move unless move_into_check?(move)
    end
    val_moves
  end
  
  def move_into_check?(pos)
    new_board = @board.dup
    new_board.move!(self.pos, pos)
    new_board.check(self.color)
  end
  
  def dup(board)
    new_piece = self.class.new(self.pos, self.color, board)
  end
end
