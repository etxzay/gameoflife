require 'csv'

class CSVParser

  attr_accessor :filename

  def initialize(filename)
    @filename = filename
  end

  def parse
    CSV.read(@filename)
  end

end
