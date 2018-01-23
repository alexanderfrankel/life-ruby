require './cell'

class Board

  attr_reader :rows

  def initialize(seed=[])
    @seed = seed
    @rows = []
    construct!
  end

  def get_cell(row, col)
    if row < 0 || col < 0
      nil
    else
      @rows.dig(row, col)
    end
  end

  private

  def construct!
    highest_seed_row.times do |row_val|
      row = []
      highest_seed_col.times do |col_val|
        row << Cell.new(row_val, col_val)
      end
      @rows << row
    end
  end

  def highest_seed_row
    @seed.max_by(&:first).first
  end

  def highest_seed_col
    @seed.max_by(&:last).last
  end

end
