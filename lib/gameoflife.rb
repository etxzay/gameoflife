require "gameoflife/version"
require "gameoflife/universe"
require "gameoflife/telescope"
require "gameoflife/csvparser"

module Gameoflife

  attr_accessor :generation

  def init(filename)

    parser = CSVParser.new(filename)
    data = parser.parse

    coordinates = data.shift

    @telescope = Telescope.new

    @universe = Universe.new(coordinates[0].to_i, coordinates[1].to_i)
    data.each { |pair|
      @universe.animate(pair[0].to_i, pair[1].to_i)
    }

    @generation = 1
    @history = []
  end

  def turn
    @generation += 1
    @history.push(Marshal.load(Marshal.dump(@universe.particles.dup)))
    @universe.generate
  end

  def end?
    finish = false

    if @universe.strength == 0
      finish = true
    else
      if @history.include?(@universe.particles)
        finish = true
      end
    end

    finish
  end

  def draw
    @telescope.clear
    @telescope.show(@universe.particles)
  end

  def play
    draw
    sleep(2)
    while !end? do
      turn
      draw
      sleep(2)
    end
    @generation
  end

end
