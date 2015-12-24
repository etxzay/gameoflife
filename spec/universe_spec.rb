require 'gameoflife/universe'

describe Universe do

  let(:universe) { Universe.new(4, 4) }
  let(:particle) { Particle.new(2, 2, true) }

  it 'new universe contain two-dimensional array as particle storage' do
    expect(universe.get(3,3)).not_to eq nil
  end

  describe "#get" do

    it 'with correct coordinates' do
      universe = Universe.new(4, 4)
      expect(universe.get(2, 2)).to eq Particle.new(2, 2, false)
    end

    it 'with out of bound coordinates' do
      universe = Universe.new(4, 4)
#      expect(universe.get(4, 0)).to eq Particle.new(0, 0, false)
#      expect(universe.get(0, 4)).to eq Particle.new(0, 0, false)
#      expect(universe.get(0, -1)).to eq Particle.new(0, 3, false)
#      expect(universe.get(-1, 0)).to eq Particle.new(3, 0, false)
      expect(universe.get(4, -1)).to eq Particle.new(0, 3, false)
      expect(universe.get(4, 4)).to eq Particle.new(0, 0, false)
      expect(universe.get(-1, 4)).to eq Particle.new(3, 0, false)
      expect(universe.get(-1, -1)).to eq Particle.new(3, 3, false)
    end

    it 'with way out of bound coordinates' do
      universe = Universe.new(4, 4)
      expect(universe.get(14, -11)).to eq Particle.new(2, 1, false)
      expect(universe.get(24, 34)).to eq Particle.new(0, 2, false)
      expect(universe.get(-41, 54)).to eq Particle.new(3, 2, false)
      expect(universe.get(-61, -101)).to eq Particle.new(3, 3, false)
    end

  end

  it 'add a particle to universe' do
    universe = Universe.new(4, 4)
    universe.add(particle)
    expect(universe.get(2, 2)).to eq particle
  end

  it 'clear should empty particles array' do
    universe.add(particle)
    universe.clear
    expect(universe.get(2, 2).alive?).to eq false
  end

  describe "#neighbours" do

    it 'size is always 8' do
      sparks = universe.neighbours(particle)
      expect(sparks.size).to eq 8
    end

    it 'correct set from the middle' do
      sparks = universe.neighbours(particle)
      expect(sparks.include?(Particle.new(2,1,false))).to eq true
      expect(sparks.include?(Particle.new(3,1,false))).to eq true
      expect(sparks.include?(Particle.new(3,2,false))).to eq true
      expect(sparks.include?(Particle.new(3,3,false))).to eq true
      expect(sparks.include?(Particle.new(2,3,false))).to eq true
      expect(sparks.include?(Particle.new(1,3,false))).to eq true
      expect(sparks.include?(Particle.new(1,2,false))).to eq true
      expect(sparks.include?(Particle.new(1,1,false))).to eq true
      expect(sparks.include?(Particle.new(2,2,true))).to eq false
    end

    it 'correct set from the bottom right corner' do
      sparks = universe.neighbours(Particle.new(3,3,true))
      expect(sparks.include?(Particle.new(3,2,false))).to eq true
      expect(sparks.include?(Particle.new(2,2,false))).to eq true
      expect(sparks.include?(Particle.new(2,3,false))).to eq true
      expect(sparks.include?(Particle.new(2,0,false))).to eq true
      expect(sparks.include?(Particle.new(3,0,false))).to eq true
      expect(sparks.include?(Particle.new(0,2,false))).to eq true
      expect(sparks.include?(Particle.new(0,3,false))).to eq true
      expect(sparks.include?(Particle.new(0,0,false))).to eq true
    end

  end

  describe "#generate" do

    it 'creates new generation of particles' do
      universe = Universe.new(4, 4)
      universe.add(Particle.new(1, 1, true))
      universe.add(Particle.new(2, 1, true))
      universe.add(Particle.new(1, 2, true))
      universe.generate
      expect(universe.get(2,2).alive?).to eq true
    end

    it 'kill some old particles' do
      universe = Universe.new(4, 4)
      universe.add(Particle.new(2, 1, true))
      universe.add(Particle.new(1, 2, true))
      universe.generate
      expect(universe.get(1, 2).alive?).to eq false
      expect(universe.get(2, 1).alive?).to eq false
    end

  end

end
