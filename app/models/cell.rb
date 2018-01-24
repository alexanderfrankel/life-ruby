class Cell

  def initialize(coordinates, live=false)
    @live = live
    @coordinates = validate_coordinates(coordinates)
  end

  def row_index
    @coordinates[0]
  end

  def col_index
    @coordinates[1]
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

  private

  def validate_coordinates(coordinates)
    raise_argument_error(coordinates) unless valid_coordinates?(coordinates)
    coordinates
  end

  def valid_coordinates?(coordinates)
    if coordinates[0].nil? || coordinates[1].nil?
      false
    else
      coordinates[0] >= 0 && coordinates[1] >= 0
    end
  end

  def raise_argument_error(coordinates)
    raise ArgumentError, "Cell coordinates #{coordinates} are invalid!"
  end

end
