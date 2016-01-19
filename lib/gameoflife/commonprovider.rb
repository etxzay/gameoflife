require "ioc_rb"

module CommonProvider

  def container
    container = IocRb::Container.new do |c|
      c.bean(:parser, class: CSVParser)
    end 
  end

end
