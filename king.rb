#encoding: utf-8
class King < SteppingPiece
  
  def move_poss
    [[1, 1], [-1, -1], [-1, 1], [1, -1], [1, 0], [0, 1], [-1, 0], [0, -1]]
  end
  def display_value
    self.color == :white ? '♔  ' : '♚  ' 
  end
end