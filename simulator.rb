require 'pry'
class Simulator < Robot

  INSTRUCTIONS = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }

  def initialize()
    @instructions = []
    @robot = []
  end

  def instructions(commands)
    commands = commands.chars
    commands.each {|command| @instructions << INSTRUCTIONS[command]}
    @instructions
  end

  def place(robot, x: 0, y: 0, direction: :south)
    robot.at(x, y)
    robot.orient(direction)
    @robot << robot
  end

  def evaluate(robot, commands)
    @instructions = []
    robot = @robot.select { |r| r.object_id  == robot.object_id  }.first
    instructions(commands)
    @instructions.each {|instruction| robot.public_send(instruction) }
  end
end
