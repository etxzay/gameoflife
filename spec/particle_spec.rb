require 'gameoflife/particle'

describe Particle do

  let (:particle) { Particle.new(2, 4, true) }

  it "store coordinats" do
    expect(particle.x).to eq 2
    expect(particle.y).to eq 4
  end
  
  it "dead or alive" do
    expect(particle.alive?).to eq true
    dead = Particle.new(1, 1, false)
    expect(dead.alive?).to eq false
  end

  it "two different objects with the same values should be ==" do
    expect(particle).to eq(Particle.new(2, 4, true))
  end

end
