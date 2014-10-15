#encoding: utf-8

class Knight < SteppingPiece
  def move_poss
    [[2, 1], [2, -1], [-2, -1], [-2, 1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end
  def display_value
    self.color == :white ? '♘  ' : '♞  ' 
  end
end
