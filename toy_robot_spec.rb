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

    it 'will ignore out of bounds co-ordinates' do
      @robot.place(1,5)
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
  end
end
