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
end
