require 'spec_helper'

describe Gameoflife do

  let(:dummy_class) { Class.new { include Gameoflife }.new }
  let(:coordinates) { [["4","5"],["2","1"],["1","2"]] }
  let(:universe) { dummy_class.instance_variable_get(:@universe) }

  before do
    allow_any_instance_of(CSVParser).to receive(:parse).and_return(coordinates)
    allow_any_instance_of(Telescope).to receive(:show)
  end

  it 'has a version number' do
    expect(Gameoflife::VERSION).not_to be nil
  end

  describe '#init' do

    it 'able to read initial state' do
      dummy_class.init("test.txt")
      expect(universe.instance_of?(Universe)).to eq true
    end

    it 'first coordinates should bound the universe' do
      dummy_class.init("test.txt")
      expect(universe.instance_variable_get(:@width)).to eq 4
      expect(universe.instance_variable_get(:@height)).to eq 5
    end

  end

  it '#turn creates new generation' do
    dummy_class.init("test.txt")
    expect(universe).to receive(:generate)
    dummy_class.turn
  end

  it '#draw displays state' do
    dummy_class.init("test.txt")
    expect(dummy_class.instance_variable_get(:@telescope)).to receive(:show)
    dummy_class.draw
  end

  it '#end? checks end of game condition' do
  end

  it '#play makes turns untill end of game' do
  end

end
