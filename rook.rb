#encoding: utf-8


class Rook < SlidingPiece
  
  def move_dirs
    H_AND_V
  end
  def display_value
    self.color == :white ? '♖  ' : '♜  ' 
  end
end
