require 'gameoflife/universe'

describe Universe do

  describe 'add & get particles methods' do
    it 'should add a particle to universe' do
      particle = Particle.new(2,2,true)
      universe = Universe.new(4,4)
      universe.add(particle)
      expect(universe.get(2,2)).to eq particle
    end
  end

end
