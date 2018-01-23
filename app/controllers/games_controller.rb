class GamesController

  def initialize(game)
    @game = game
  end

  def start_game!
    loop do
      GamesView.render(@game)
      tick!
      sleep 2
      system("clear")
    end
  end

  private

  def tick!
    @game.board.rows.each do |row|
      row.each do |cell|
        transition_cell(cell)
      end
    end
  end

  def transition_cell(cell)
    live_neighbors = get_live_neighbors(cell)
    case
    when cell.alive? && live_neighbors.count < 2
      cell.dead!
    when cell.alive? && (live_neighbors.count == 2 || live_neighbors.count == 3)
    when live_neighbors.count > 3
      cell.dead!
    when !cell.alive? && live_neighbors.count == 3
      cell.alive!
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
    @game.board.get_cell(cell.row_index - 1, cell.col_index)
  end

  def cell_bottom(cell)
    @game.board.get_cell(cell.row_index + 1, cell.col_index)
  end

  def cell_left(cell)
    @game.board.get_cell(cell.row_index, cell.col_index - 1)
  end

  def cell_right(cell)
    @game.board.get_cell(cell.row_index, cell.col_index + 1)
  end

  def cell_top_left(cell)
    @game.board.get_cell(cell.row_index - 1, cell.col_index - 1)
  end

  def cell_top_right(cell)
    @game.board.get_cell(cell.row_index - 1, cell.col_index + 1)
  end

  def cell_bottom_left(cell)
    @game.board.get_cell(cell.row_index + 1, cell.col_index - 1)
  end

  def cell_bottom_right(cell)
    @game.board.get_cell(cell.row_index + 1, cell.col_index + 1)
  end
end
