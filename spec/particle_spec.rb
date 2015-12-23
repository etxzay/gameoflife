require 'gameoflife/particle'

describe Particle do
  context "braindead constructor checking" do
    it "creates new alive particle" do
      part = Particle.new(2,4,true)
      expect(part.x).to eq 2
      expect(part.y).to eq 4
      expect(part.alive?).to eq true
    end
  end
end
