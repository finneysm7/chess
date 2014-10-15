#encoding: utf-8

class Board
  attr_accessor :grid
  def initialize
    @grid = Array.new(8) {|i| Array.new(8) {|j| nil }}
  end
  
  def starting_board
    @grid.each_with_index do |row, i|
      row.each_index do |j|
        i == 0 || i == 1 ? color = :black : color = :white
        grid[i][j] = Pawn.new([i, j], color, self) if i == 1 || i == 6
        if i == 0 || i == 7
          grid[i][j] = Rook.new([i, j], color, self) if j == 0 || j == 7
          grid[i][j] = Knight.new([i, j], color, self) if j == 1 || j == 6
          grid[i][j] = Bishop.new([i, j], color, self) if j == 2 || j == 5
          grid[i][j] = Queen.new([i, j], color, self) if j == 3
          grid[i][j] = King.new([i, j], color, self) if j == 4
        end
      end
    end
    @grid
  end
  
  def in_board?(pos)
    pos[0] < 8 && pos[0] > -1 && pos[1] < 8 && pos[1] > -1
  end
  
  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, piece)
    @grid[pos[0]][pos[1]] = piece
  end
  
  def check(color)
    #find the position of the king on the board
    #see if any of the opposing pieces can move to that position
    muh_king = color(color).find {|piece| piece.is_a?(King)}
    color(other_color(color)).any?{ |piece| piece.moves.include?(muh_king.pos)}
  end
  
  def other_color(color)
    color == :white ? :black : :white 
  end
  
  def color(color)
    @grid.flatten.compact.select {|piece| piece.color == color}
  end
  
  def move!(start, end_pos)
    move_piece, self[start] = self[start], nil
    move_piece.pos = end_pos
    move_piece.has_moved = true if move_piece.class == Pawn
    self[end_pos] = nil
    self[end_pos] = move_piece 
  end
  
  def move(start, end_pos, color)
    if self[start] == nil
      raise "There is no piece there"
    end
    unless self[start].color == color
      raise "Wrong color piece Brosephus" 
    end
    unless self[start].moves.include?(end_pos)
      raise "Cannot move piece at #{convert(start)} to #{convert(end_pos)}"
    end
    unless self[start].valid_moves.include?(end_pos)
      raise "Invaid move: that move will put you in check"
    end
    self.move!(start, end_pos)
  end
  
  
  def convert(pos)
    arr = %w(a b c d e f g h)
    [arr[pos[1]], (8 - pos[0]).to_s].join  
  end
  
  def dup
    new_board = Board.new()
    @grid.each_with_index do |row, idx|
      row.each_with_index do |square, j|
        new_board[[idx, j]] = square.dup(new_board) unless square == nil
      end
    end
    new_board
  end
  
  def checkmate?(color)
    if self.check(color)
      return color(color).all? {|piece| piece.valid_moves.empty? }
    end
    false
  end
  
  def display
    flag = true
    @grid.each_with_index do |el, idx|
      display_grid = []
      (idx + 2).even? ? flag = true : flag = false
      el.each_with_index do |cell, j|
        if cell == nil 
          if flag
            (j + 2).even? ? display_grid << '++ ' : display_grid << '-- '
          else
            (j + 2).even? ? display_grid << '-- ' : display_grid << '++ '
          end
        else
          display_grid << cell.display_value
        end
      end
      print "#{8 - idx} "
      display_grid.each do |space|
        print space
      end
      
      print "\n"
    end
    puts "  a  b  c  d  e  f  g  h"
  end
end