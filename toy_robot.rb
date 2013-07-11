class ToyRobot
  attr_reader :location
  TABLE_BOUNDS = 5

  def place(x,y)
    @location = [x,y] if (x < TABLE_BOUNDS and y < TABLE_BOUNDS)
  end
end
