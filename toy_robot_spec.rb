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
  end
end
