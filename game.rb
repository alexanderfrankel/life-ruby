require './board'

class Game

  def initialize(seed=[])
    @board = Board.new(seed)
    seed.each do |alive_cell|
      @board.rows[alive_cell[0] - 1][alive_cell[1] - 1].alive!
    end
  end

  def start!
    until game_over?
      render
      tick!
      sleep 1
      system("clear")
      sleep 1
    end
  end

  private

  def game_over?
    false
  end

  def tick!
    @board.rows.each do |row|
      row.each do |cell|
        transition_cell(cell)
      end
    end
  end

  def transition_cell(cell)
    live_neighbors = get_live_neighbors(cell)
    case
    when live_neighbors.count < 3
      cell.dead!
    when live_neighbors.count > 3
      cell.dead!
    end
  end

  def get_live_neighbors(cell)
    cell_neighbors(cell).each_with_object([]) do |neighbor_cell, live_neighbors|
      live_neighbors << neighbor_cell if !!neighbor_cell&.alive?
    end
  end

  def cell_neighbors(cell)
    [
      cell_top(cell),
      cell_bottom(cell),
      cell_left(cell),
      cell_right(cell),
      cell_top_left(cell),
      cell_top_right(cell),
      cell_bottom_left(cell),
      cell_bottom_right(cell)
    ]
  end

  def cell_top(cell)
    @board.get_cell(cell.row_index - 1, cell.col_index)
  end

  def cell_bottom(cell)
    @board.get_cell(cell.row_index + 1, cell.col_index)
  end

  def cell_left(cell)
    @board.get_cell(cell.row_index, cell.col_index - 1)
  end

  def cell_right(cell)
    @board.get_cell(cell.row_index, cell.col_index + 1)
  end

  def cell_top_left(cell)
    @board.get_cell(cell.row_index - 1, cell.col_index - 1)
  end

  def cell_top_right(cell)
    @board.get_cell(cell.row_index - 1, cell.col_index + 1)
  end

  def cell_bottom_left(cell)
    @board.get_cell(cell.row_index + 1, cell.col_index - 1)
  end

  def cell_bottom_right(cell)
    @board.get_cell(cell.row_index + 1, cell.col_index + 1)
  end

  def render
    @board.rows.each do |row|
      row.each do |cell|
        if cell.alive?
          print 'x '
        else
          print '- '
        end
      end
      puts
    end
  end

end

game = Game.new([[2, 2], [4, 4]])
game.start!
