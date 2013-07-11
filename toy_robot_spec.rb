require_relative 'toy_robot'

describe ToyRobot do
  before(:each) do
    @robot = ToyRobot.new
  end

  describe 'Place' do
    it 'will place the robot in the correct X,Y co-ordinates' do
      @robot.place(1,3)
      @robot.location.should eql [1,3]
    end
    it 'will not place the robot in an out of bounds co-ordinates' do
      @robot.place(1,5)
      @robot.location.should be_nil
    end
  end
end
