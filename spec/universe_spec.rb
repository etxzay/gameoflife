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

    it 'correct set from the corner/border' do
      sparks = universe.neighbours(Particle.new(0,0,true))
      expect(sparks.include?(Particle.new(0,1,false))).to eq true
      expect(sparks.include?(Particle.new(1,1,false))).to eq true
      expect(sparks.include?(Particle.new(1,0,false))).to eq true
      expect(sparks.include?(Particle.new(3,3,false))).to eq true
      expect(sparks.include?(Particle.new(0,3,false))).to eq true
      expect(sparks.include?(Particle.new(1,3,false))).to eq true
      expect(sparks.include?(Particle.new(3,0,false))).to eq true
      expect(sparks.include?(Particle.new(3,1,false))).to eq true
    end

  end

end
