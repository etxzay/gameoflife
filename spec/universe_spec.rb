require 'gameoflife/universe'

describe Universe do

  let(:universe) { Universe.new(4, 4) }
  let(:particle) { Particle.new(2, 2, true) }

  it 'new universe contain two-dimensional array as particle storage' do
    expect(universe.get(3,3)).not_to eq nil
  end

  it 'add a particle to universe' do
    universe.add(particle)
    expect(universe.get(2, 2)).to eq particle
  end

  it 'clear should empty particles array' do
    universe.add(particle)
    universe.clear
    expect(universe.get(2, 2).alive?).to eq false
  end

  it 'draw all containing particles' do
    universe.add(particle)
    expect{ universe.draw }.to output("\n....\n....\n..X.\n....").to_stdout
  end

end
