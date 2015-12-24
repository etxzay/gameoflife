require "gameoflife/particle"

class Universe

  attr_reader :particles

  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  def neighbours(particle)
    
  end 

  def add(particle)
    @particles[particle.y][particle.x] = particle
  end

  def get(x,y)
    @particles[y][x]
  end

  def clear
    @particles = Array.new(@height) { Array.new(@width) }
    for y in 0..@height-1 do
      for x in 0..@width-1 do
        add(Particle.new(x, y, false))
      end
    end
  end

  def generate

  end

end
