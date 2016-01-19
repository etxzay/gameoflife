require 'csv'

class CSVParser

  attr_accessor :filename

  def parse
    CSV.read(@filename)
  end

end
