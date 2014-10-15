#encoding: utf-8

class SlidingPiece < Piece
  
  DIAGS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  
  H_AND_V = [[1, 0], [0, 1], [-1, 0], [0, -1]]
  
  
  def moves
    #Needs to know what directions a piece can move in
    #needs to call move_dirs in order to know where to move the piece
    result = []
    move_dirs.each do |option|
      position = self.pos.dup
      position = [position[0] + option[0], position[1] + option[1]]
      while @board.in_board?(position) && 
        (board[position] == nil || board[position].color != self.color) 
        
        result << position 
        break if board[position] != nil && board[position].color != self.color 
        position = [position[0] + option[0], position[1] + option[1]]
      end
    end
    result
  end
  
end