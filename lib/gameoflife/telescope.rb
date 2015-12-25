class Telescope

  def show(particles)
    particles.each { |row|
      print "\n"
      row.each { |particle|
        draw(particle)
      } 
    }
  end

  def draw(particle)
    print particle
  end

  def clear
    system "clear" or system "cls"
  end

end
