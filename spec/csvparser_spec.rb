require 'gameoflife/csvparser'
require 'tempfile'

RSpec.describe CSVParser do

  let(:data) { [["1","1"], ["1","2"], ["2","1"]] }

  it "should remember file name" do
    parser = CSVParser.new("test.txt")
    expect(parser.filename).to eq("test.txt")
  end

  it "parse simple CSV file and return array" do
    file = Tempfile.new('csvtest')
    file.write("1,1\n1,2\n2,1")
    file.close
    csvparser = CSVParser.new(file.path)
    expect(csvparser.parse).to eq(data)
    file.unlink
  end

end
