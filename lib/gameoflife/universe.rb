require "gameoflife/particle"

class Universe

  attr_reader :particles

  def initialize(width, height)
    @width = width
    @height = height
#    @checklist = Array.new
    clear
  end

  def neighbours(central)
    @nbrs = Array.new
    @nbrs.push(@particles[central.y-1][central.x])
    @nbrs.push(@particles[central.y-1][central.x+1])
    @nbrs.push(@particles[central.y][central.x+1])
    @nbrs.push(@particles[central.y+1][central.x+1])
    @nbrs.push(@particles[central.y+1][central.x])
    @nbrs.push(@particles[central.y+1][central.x-1])
    @nbrs.push(@particles[central.y][central.x-1])
    @nbrs.push(@particles[central.y-1][central.x-1])
  end 

  def add(particle)
    @particles[particle.y][particle.x] = particle
  end

  def get(x,y)
    @particles[y][x]
  end

  def clear
  
    if @particles == nil
      @particles = Array.new(@height) { Array.new(@width) }
    end

    for y in 0..@height-1 do
      for x in 0..@width-1 do

        current = get(x,y)

        if current == nil
          current = Particle.new(x, y, false)
        else
          current.alive = false
        end

        add(current)

      end
    end

  end

  def generate

  end

end
