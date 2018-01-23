require './app/models/board'

class Game

  attr_reader :board

  def initialize(seed=[])
    @seed = seed
    @board = Board.new(seed)
    set_initial_board_state!
  end

  private

  def set_initial_board_state!
    @seed.each do |seed_cell|
      @board.rows[seed_cell[0] - 1][seed_cell[1] - 1].alive!
    end
  end

end
