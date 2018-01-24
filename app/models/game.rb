require './app/models/board'

class Game

  attr_reader :board

  def initialize(seed=[])
    @seed = seed
    @board = Board.new(seed)
    set_initial_board_state!
  end

  def start_game!
    loop do
      GamesView.render(@board)
      tick!
      sleep 1
      system("clear")
    end
  end

  private

  def tick!
    @seed = []
    @board.rows.each do |row|
      row.each do |cell|
        live_neighbors = get_live_neighbors(cell)
        toggle_cell = toggle_cell?(cell, live_neighbors)
        if cell.alive? && !toggle_cell
          @seed << [cell.row_index + 1, cell.col_index + 1]
        elsif !cell.alive? && toggle_cell
          @seed << [cell.row_index + 1, cell.col_index + 1]
        end
      end
    end
    if @seed.any?
      @board = Board.new(@seed)
      set_initial_board_state!
    end
  end

  def toggle_cell?(cell, live_neighbors)
    case
    when cell.alive? && live_neighbors.count < 2
      true
    when cell.alive? && (live_neighbors.count == 2 || live_neighbors.count == 3)
    when cell.alive? && live_neighbors.count > 3
      true
    when !cell.alive? && live_neighbors.count == 3
      true
    end
  end

  def transition_cell(cell)
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

  def set_initial_board_state!
    @seed.each do |seed_cell|
      @board.rows[seed_cell[0] - 1][seed_cell[1] - 1].alive!
    end
  end

end
