class ToyRobot
  attr_reader :location
  attr_reader :direction
  TABLE_BOUNDS = 0..4

  def place(x,y,direction=nil)
    @direction = direction if direction
    @location = [x,y] if (TABLE_BOUNDS.include?(x) and TABLE_BOUNDS.include?(y))
  end

  def move
    case direction
    when 'NORTH'
      place(location[0], location[1] + 1)
    when 'SOUTH'
      place(location[0], location[1] - 1)
    when 'EAST'
      place(location[0] + 1, location[1])
    when 'WEST'
      place(location[0] - 1, location[1] )
    end
  end
end
