require "gameoflife/version"
require "gameoflife/universe"
require "gameoflife/telescope"
require "gameoflife/csvparser"

module Gameoflife

  attr_accessor :generation

  def init(filename)

    parser = CSVParser.new(filename)
    data = parser.parse

    coordinates = data.pop

    @universe = Universe.new(coordinates[0].to_i, coordinates[1].to_i)
    data.each { |pair|
      @universe.animate(pair[0].to_i, pair[1].to_i)
    }

  end

  def turn
  end

  def end?
  end

  def draw
  end

  def play
  end

end
