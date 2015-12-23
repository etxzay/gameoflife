class Universe

  def initialize(width, height)
    @width = width
    @height = height
    @particles = Array.new(width) { Array.new(height) }
  end

  def neighbours(particle)
    
  end 

  def add(particle)
    @particles[particle.x][particle.y] = particle
  end

  def get(x,y)
    @particles[x][y]
  end

  def generate

  end

  def print

  end

end
