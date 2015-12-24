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
    if particle.alive?
      print "X"
    else
      print "O"
    end
  end

end
