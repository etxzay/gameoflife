require "gameoflife/particle"

class Universe

  attr_reader :particles

  def initialize(width, height)
    @width = width
    @height = height
    @checklist = Array.new
    clear
  end

  def neighbours(central)
    @nbrs = Array.new
    @nbrs.push(get(central.x, central.y-1))
    @nbrs.push(get(central.x+1, central.y-1))
    @nbrs.push(get(central.x+1, central.y))
    @nbrs.push(get(central.x+1, central.y+1))
    @nbrs.push(get(central.x, central.y+1))
    @nbrs.push(get(central.x-1, central.y+1))
    @nbrs.push(get(central.x-1, central.y))
    @nbrs.push(get(central.x-1, central.y-1))
  end 

  def animate(x, y)
    particle = get(x, y)
    particle.alive(true)

    mark(particle)
  end

  def get(x, y)
    inborderX = bound(x, @width)
    inborderY = bound(y, @height)
    @particles[inborderY][inborderX]
  end

  def strength
    result = 0
    if !@checklist.empty?
      @checklist.each { |element|
        if element.alive?
          result += 1
        end
      }
    end
    result
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
          current.alive(false)
        end

        add(current)

      end
    end

  end

  def generate

    oldlist = @checklist
    @checklist = []
    oldlist.each { |spark|
      aliveNeighbours = countAliveNeighbours(spark)

      if spark.alive?
        if aliveNeighbours != 2 && aliveNeighbours != 3
          spark.alive(false)
        else
          mark(spark)
        end
      else
        if aliveNeighbours == 3
          spark.alive(true)
          mark(spark)
        end
      end
    }

  end

  private

    def countAliveNeighbours(particle)
      nbrsAlive = 0
      nbrs = neighbours(particle)
      nbrs.each { |neighbour|
        if neighbour.alive?
          nbrsAlive += 1
        end 
      }
      nbrsAlive
    end

    def bound(value, limit)
      if value >= limit
        value = value - limit
        value = bound(value, limit)
      end
      if value < 0
        value = limit + value
        value = bound(value, limit)
      end
      value
    end

    def add(particle)
      @particles[particle.y][particle.x] = particle

      if particle.alive?
        mark(particle)
      end
    end

    def mark(particle)
      @checklist.push(particle)
      @checklist = @checklist | neighbours(particle)
    end

end
