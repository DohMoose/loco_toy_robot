if ARGV.length != 1
  puts <<-EOF
  Please provide a file name
  Usage: 
     ruby program.rb <filename>
EOF
else
  require_relative 'toy_robot'

  commands = ARGF.read 

  toy_robot = ToyRobot.new
  toy_robot.read_commands(commands)
end
