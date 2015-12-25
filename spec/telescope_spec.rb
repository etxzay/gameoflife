require 'gameoflife/telescope'

describe Telescope do

  let(:alive) { Particle.new(2, 2, true) }
  let(:universe) { Universe.new(4, 4) }
  let(:telescope) { Telescope.new }

  it "shows particles to console" do
    #TODO remove Universe & Particle  test dependancy
    universe.animate(2, 2)
    expect{ telescope.show(universe.particles) }.to output("\n____\n____\n__X_\n____").to_stdout
  end

  it "draw 'X' when alive" do
    expect{ telescope.draw(alive) }.to output("X").to_stdout
  end

  it "draw '_' when dead" do
    dead = Particle.new(2, 3, false)
    expect{ telescope.draw(dead) }.to output("_").to_stdout
  end

end
