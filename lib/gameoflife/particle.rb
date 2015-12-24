class Particle

  attr_accessor :x, :y
  attr_writer :alive

  def initialize(x, y, alive)
    @x = x
    @y = y
    @alive = alive
  end

  def alive?
    @alive
  end

  def draw
    if @alive
      print "X"
    else
      print "."
    end
  end

  def ==(other)

    if other != nil && other.instance_of?(Particle)
      if other.x == @x && other.y == @y && other.alive? == @alive
        result = true
      else
        result = false
      end
    else
      result = false
    end

    result

  end

end
