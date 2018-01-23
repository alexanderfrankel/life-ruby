class Cell

  attr_reader :live

  def initialize
    @live = false
  end

  def alive!
    @live = true
  end
end
