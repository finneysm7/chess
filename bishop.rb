#encoding: utf-8


class Bishop < SlidingPiece
  def move_dirs
    DIAGS
  end
  def display_value
    self.color == :white ? '♗  ' : '♝  ' 
  end
end