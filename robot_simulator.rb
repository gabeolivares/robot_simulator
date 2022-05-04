require 'pry'

class Robot
  DIRECTIONS = [:south, :east, :north, :west]
  def initialize
    @orient_position = 0
    @x_coordinate = 0
    @y_coordinate = 0
    @coordinates = [@x_coordinate, @y_coordinate]
  end

  def orient(direction)
    postion = DIRECTIONS.find_index(direction)
    raise ArgumentError if postion.nil?
    @orient_position = postion
  end

  def bearing
    DIRECTIONS[@orient_position]
  end

  def turn_right
    @orient_position -= 1
    @orient_position %= 4
  end

  def turn_left
     @orient_position += 1
     @orient_position %= 4
   end

   def at(position_x, position_y)
     raise ArgumentError if position_x.nil? || position_y.nil?
     @x_coordinate = position_x
     @y_coordinate = position_y
     @coordinates = [@x_coordinate, @y_coordinate]
   end

   def coordinates
     @coordinates
   end

   def advance
     case DIRECTIONS[@orient_position]
      when :north
        @y_coordinate = @y_coordinate + 1
        @coordinates = [@x_coordinate , @y_coordinate]
      when :east
        @x_coordinate = @x_coordinate + 1
        @coordinates = [@x_coordinate , @y_coordinate]
      when :south
        @y_coordinate = @y_coordinate - 1
        @coordinates = [@x_coordinate , @y_coordinate]
      when :west
        @x_coordinate = @x_coordinate - 1
        @coordinates = [@x_coordinate , @y_coordinate]
      end
   end
end
