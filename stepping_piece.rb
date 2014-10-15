#encoding: utf-8


class SteppingPiece < Piece
  
  def moves
    #refactor for stepping pieces
    result = []
    move_poss.each do |option|
      position = self.pos.dup
      position = [position[0] + option[0], position[1] + option[1]]
      if @board.in_board?(position) && 
        (board[position] == nil || board[position].color != self.color)
        
        result << position
      end
    end
    result
  end
  
end