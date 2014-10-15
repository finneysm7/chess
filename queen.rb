#encoding: utf-8

class Queen < SlidingPiece
  
  def move_dirs
    DIAGS + H_AND_V
  end
  
  def display_value
    self.color == :white ? '♕  ' : '♛  ' 
  end
end
