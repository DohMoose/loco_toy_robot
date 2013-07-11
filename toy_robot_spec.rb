require_relative 'toy_robot'

describe ToyRobot do
  before(:each) do
    @robot = ToyRobot.new
  end

  describe 'Place' do
    it 'will set valid X,Y co-ordinates' do
      @robot.place(1,3)
      @robot.location.should eql [1,3]
    end

    it 'will ignore out of upper bounds co-ordinates' do
      @robot.place(1,5)
      @robot.location.should be_nil
    end

    it 'will ignore out of lower bounds co-ordinates' do
      @robot.place(-1,3)
      @robot.location.should be_nil
    end

    it 'will set the direction' do
      @robot.place(1,3,'NORTH')
      @robot.direction.should eql 'NORTH'
    end

    it 'will cope with strings' do
      @robot.place('3','2', 'EAST')
      @robot.location.should eql [3,2]
    end
  end

  describe 'Move' do
    it 'will move one square NORTH' do
      @robot.place(2,2,'NORTH')
      @robot.move
      @robot.location.should eql [2,3]
    end

    it 'will move one square SOUTH' do
      @robot.place(2,2,'SOUTH')
      @robot.move
      @robot.location.should eql [2,1]
    end

    it 'will move one square EAST' do
      @robot.place(2,2,'EAST')
      @robot.move
      @robot.location.should eql [3,2]
    end

    it 'will move one square WEST' do
      @robot.place(2,2,'WEST')
      @robot.move
      @robot.location.should eql [1,2]
    end

    it 'will not move off the south west corner' do
      @robot.place(0,0, 'SOUTH')
      @robot.move
      @robot.location.should eql [0,0]
    end

    it 'will not move off the north east corner' do
      @robot.place(4,4, 'EAST')
      @robot.move
      @robot.location.should eql [4,4]
    end

    it 'will not change direction' do
      @robot.place(4,4, 'EAST')
      @robot.move
      @robot.direction.should eql 'EAST'
    end
  end

  describe 'Turn' do
    it 'will turn left from south to east' do
     @robot.place(4,4, 'SOUTH')
     @robot.left
     @robot.direction.should eql 'EAST'
    end

    it 'will turn left from north to west' do
     @robot.place(4,4, 'NORTH')
     @robot.left
     @robot.direction.should eql 'WEST'
    end

    it 'will turn right from north to east' do
      @robot.place(4,4, 'NORTH')
      @robot.right
      @robot.direction.should eql 'EAST'
    end

    it 'will turn right from west to north' do
      @robot.place(4,4, 'WEST')
      @robot.right
      @robot.direction.should eql 'NORTH'
    end
  end

  describe 'Report' do
    it 'will report on location and direction' do
      STDOUT.should_receive(:puts).with('2,1,NORTH')
      @robot.place(2,1, 'NORTH')
      @robot.report
    end

    it 'will not report when not on table' do
      STDOUT.should_not_receive(:puts)
      @robot.report
      @robot.place(12,3, 'NORTH')
      @robot.report
    end
  end

  describe 'read_commands' do
    it 'will receive move' do
      @robot.should_receive(:move)
      @robot.read_commands("move")
    end

    it 'will receive left' do
      @robot.should_receive(:left)
      @robot.read_commands("left")
    end

    it 'will receive right' do
      @robot.should_receive(:right)
      @robot.read_commands("right")
    end

    it 'will receive report' do
      @robot.should_receive(:report)
      @robot.read_commands("report")
    end

    it 'will receive place' do
      @robot.should_receive(:place).with('3','4', 'NORTH')
      @robot.read_commands('place 3,4,NORTH')
    end
  end

  describe 'integrations' do
    it 'should run example 1' do
      commands = <<CMD 
PLACE 0,0,NORTH 
MOVE
REPORT      
CMD
      STDOUT.should_receive(:puts).with('0,1,NORTH')
      @robot.read_commands(commands)
    end
  end
end
