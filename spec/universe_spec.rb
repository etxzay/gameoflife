require 'gameoflife/universe'

describe Universe do

  let(:universe) { Universe.new(4,4) }

  describe 'new universe' do
    it 'should contain empty two-dimensional array as particle storage' do
      expect(universe.get(3,3)).to eq nil
    end
  end

  describe 'add & get particles methods' do
    it 'should add a particle to universe' do
      particle = Particle.new(2,2,true)
      universe.add(particle)
      expect(universe.get(2,2)).to eq particle
    end
  end

end
