require 'spec_helper'

describe Gameoflife do

  let(:dummy_class) { Class.new { include Gameoflife }.new }
  let(:coordinates) { [["4","5"],["2","1"],["1","2"]] }

  before do
    allow_any_instance_of(CSVParser).to receive(:parse).and_return(coordinates)
  end

  it 'has a version number' do
    expect(Gameoflife::VERSION).not_to be nil
  end

  describe '#init' do

    it 'able to read initial state' do
      dummy_class.init("test.txt")
      expect(dummy_class.instance_variable_get(:@universe).instance_of?(Universe)).to eq true
    end

    it 'first coordinates should bound the universe' do
      dummy_class.init("test.txt")
      expect(dummy_class.instance_variable_get(:@universe).instance_variable_get(:@width)).to eq 4
      expect(dummy_class.instance_variable_get(:@universe).instance_variable_get(:@height)).to eq 5
    end

  end

  it 'creates new generation' do
  end

  it 'displays state' do
  end

  it 'checks end of game condition' do
  end

  it 'makes turns untill end of game' do
  end

end
