require 'gameoflife/particle'

describe Particle do

  let (:particle) { Particle.new(2, 4, true) }

  it "creates new alive particle" do
    expect(particle.x).to eq 2
    expect(particle.y).to eq 4
    expect(particle.alive?).to eq true
  end

end
