require './app/models/cell'

class Board

  attr_reader :rows

  def initialize(seed_data)
    @seed = seedify(seed_data)
    @rows = construct_rows
    set_initial_state!
  end

  def get_cell(row, col)
    if row < 0 || col < 0
      nil
    else
      @rows.dig(row, col)
    end
  end

  private

  def set_initial_state!
    @seed.each do |seed_cell|
      set_seed_cell_alive(seed_cell)
    end
  end

  def set_seed_cell_alive(seed_cell)
    get_cell(seed_cell.row_index, seed_cell.col_index).alive!
  end

  def construct_rows
    number_of_rows.times.with_object([]) do |row_index, row|
      row << construct_single_row(row_index)
    end
  end

  def construct_single_row(row_index)
    number_of_cols.times.with_object([]) do |col_index, row|
      row << create_cell(row_index, col_index)
    end
  end

  def create_cell(row_index, col_index)
    Cell.new(row_index, col_index)
  end

  def number_of_rows
    highest_seed_row_index + 2
  end

  def number_of_cols
    highest_seed_col_index + 2
  end

  def highest_seed_row_index
    @seed.max_by(&:row_index).row_index
  end

  def highest_seed_col_index
    @seed.max_by(&:col_index).col_index
  end

  Seed = Struct.new(:row_index, :col_index)

  def seedify(seed_data)
    seed_data.collect do |seed|
      Seed.new(seed[0], seed[1])
    end
  end

end
