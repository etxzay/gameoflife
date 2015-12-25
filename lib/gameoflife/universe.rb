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
    (-1..1).to_a.each { |x|
      (-1..1).to_a.each { |y|
        if !(x == 0 && y == 0)
          @nbrs.push(get(central.x + x, central.y + y))
        end
      }
    }
    @nbrs
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
    @dying = []
    @resurgent = []

    oldlist.each { |spark|

      aliveNeighbours = countAliveNeighbours(spark)

      if spark.alive?
        if aliveNeighbours != 2 && aliveNeighbours != 3
          @dying.push(spark)
          mark(spark)
        end
      else
        if aliveNeighbours == 3
          @resurgent.push(spark)
          mark(spark)
        end
      end

    }

    @dying.each { |spark|
      spark.alive(false)
    }

    @resurgent.each { |spark|
      spark.alive(true)
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
