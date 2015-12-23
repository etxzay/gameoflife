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

end
