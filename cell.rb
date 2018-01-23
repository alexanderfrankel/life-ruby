class Cell

  attr_reader :row_index
  attr_reader :col_index

  def initialize(row_index, col_index)
    @live = false
    @row_index = row_index
    @col_index = col_index
  end

  def alive?
    @live
  end

  def alive!
    @live = true
  end

  def dead!
    @live = false
  end
end
