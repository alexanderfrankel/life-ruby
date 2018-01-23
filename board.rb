class Board

  attr_reader :rows

  def initialize(height:, width:)
    @rows = []

    height.times do
      row = []
      width.times do
        row << "x"
      end
      @rows << row
    end
  end

end
