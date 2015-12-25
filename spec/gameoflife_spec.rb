require 'spec_helper'

describe Gameoflife do

  let(:dummy_class) { Class.new { include Gameoflife }.new }
  let(:coordinates) { [["4","5"],["2","1"],["1","2"]] }
  let(:universe) { dummy_class.instance_variable_get(:@universe) }

  before(:each) do
    allow_any_instance_of(CSVParser).to receive(:parse).and_return(coordinates)
    allow_any_instance_of(Telescope).to receive(:show)
    dummy_class.init("test.txt")
  end

  it 'has a version number' do
    expect(Gameoflife::VERSION).not_to be nil
  end

  describe '#init' do

    it 'able to read initial state' do
      expect(universe.instance_of?(Universe)).to eq true
    end

    it 'first coordinates should bound the universe' do
      expect(universe.instance_variable_get(:@width)).to eq 4
      expect(universe.instance_variable_get(:@height)).to eq 5
    end

  end

  describe '#turn' do

    it 'creates new generation' do
      expect(universe).to receive(:generate)
      dummy_class.turn
    end

    it 'increases generaton counter' do
      counter = dummy_class.generation
      dummy_class.turn
      expect(dummy_class.generation).to eq(counter + 1)
    end

    it 'saves history' do
      size = dummy_class.instance_variable_get(:@history).size
      dummy_class.turn
      expect(dummy_class.instance_variable_get(:@history).size).to eq(size + 1)
    end

  end

  describe '#draw' do

    it 'clear the output' do
      expect(dummy_class.instance_variable_get(:@telescope)).to receive(:clear)
      dummy_class.draw
    end

    it 'displays state' do
      expect(dummy_class.instance_variable_get(:@telescope)).to receive(:show)
      dummy_class.draw
    end

  end

  it '#end? checks end of game condition' do
  end

  it '#play makes turns untill end of game' do
  end

end
