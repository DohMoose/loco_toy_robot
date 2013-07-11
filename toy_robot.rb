class ToyRobot
  attr_reader :location
  attr_reader :direction
  TABLE_BOUNDS = 0..4
  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

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

  def new_index(index_change)
     DIRECTIONS.index(direction) + index_change if direction
  end

  def left
    if (index = new_index(-1))
      index = 3 if index < 0
      @direction = DIRECTIONS[index]
    end
  end

  def right
    if (index = new_index(1))
      index = 0 if index > 3
      @direction = DIRECTIONS[index]
    end
  end

  def report
    if location and direction
      "#{location.join(',')},#{direction}"
    end
  end

  def read_commands(commands)
    commands.lines.each do |line|
      args = line.strip.split
      if (args.length == 1)
        self.send(args[0].downcase)
      else
        self.send(args[0].downcase, args[1].split(','))
      end
    end
  end
end
