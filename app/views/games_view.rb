class GamesView

  class << self

    def render(board)
      board.rows.each do |row|
        render_row(row)
        render_newline
      end
    end

    private

    def render_row(row)
      row.each do |cell|
        render_cell(cell)
      end
    end

    def render_cell(cell)
      if cell.alive?
        print "x "
      else
        print "- "
      end
    end

    def render_newline
      print "\n"
    end

  end

end
