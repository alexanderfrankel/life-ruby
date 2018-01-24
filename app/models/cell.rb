class Cell

  def initialize(row_index, col_index)
    @row_index = row_index
    @col_index = col_index
    @live = false
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
