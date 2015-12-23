require 'gameoflife/particle'

describe Particle do

  let (:particle) { Particle.new(2, 4, true) }

  it "creates new alive particle" do
    expect(particle.x).to eq 2
    expect(particle.y).to eq 4
    expect(particle.alive?).to eq true
  end

  it "print dot when dead" do
    dead = Particle.new(2, 3, false)
    expect{ dead.draw }.to output(".").to_stdout
  end

  it "print X when alive" do
    expect{ particle.draw }.to output("X").to_stdout
  end
  
end
