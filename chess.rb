#encoding: utf-8
require './pieces.rb'
require'./sliding_piece.rb'
require './stepping_piece.rb'
require './pawn.rb'
require './queen.rb'
require './bishop.rb'
require './rook.rb'
require './knight.rb'
require './king.rb'
require './board.rb'
require './game.rb'

if __FILE__ == $PROGRAM_NAME
  g = Game.new(Board.new)
  # p g.board.grid
  g.play
  # q1 = Queen.new([4, 3], :white, b)
  # blacking = King.new([4, 4], :black, b)
  # q2 = Queen.new([4, 5], :white, b)
  # q3 = Queen.new([5, 4], :white, b)
  # q4 = Queen.new([3, 4], :white, b)
  # whiteking = King.new([0,4], :white, b)
  #
  # r = Rook.new([5,5], :black, b)
  # newpawn = Pawn.new([4, 6], :white, b)
  # reg = Pawn.new([1,1], :black, b)
  # bish = Bishop.new([3,3], :black, b)
  # goodnight = Knight.new([2, 2], :white, b)

  # p b.check(:black)
  # p q.moves
  # p q.valid_moves
  # p r.moves
  # p r.valid_moves
  # p newpawn.moves
  # p newpawn.valid_moves
  # p reg.moves
  # p reg.valid_moves
  # p bish.moves
  # p bish.valid_moves
  # p goodnight.moves
  # p goodnight.valid_moves
  # p blacking.moves
  # p blacking.valid_moves
end




