#2. Create at least 10 classes structure with at least 3 inheritance levels
# where are some real staff can be described.
# There should be some methods and properties defined.
# And also there are should be used couple modules (as mixins)
# to share behavior we shouldn't share using inheritance

module Good
  attr_writer :is_good
  def initialize
    @is_good = true
  end
end


module Evil
  attr_writer :is_good
  def initialize
    @is_good = false
  end

  def kill_char(char)
    puts "Author: #{self.name} has killed #{char.name} using #{self.weapon}"
  end
end


class MiddleEarthRaces
  attr_accessor :name, :has_ring, :is_good, :weapon
  def initialize
    @name = 'Stranger'
    @has_ring = nil
    @is_good = nil
    @weapon = nil
  end

  def is_good?(char)
    puts "#{self.name}: Is #{char.name} good?"
    case char.is_good
      when true
        puts "#{self.name}'s companion: Chill out, #{char.name} can be pleasant"
      when false
        puts "#{self.name}'s companion: Caution! #{char.name} will hurt you"
      else
        puts "#{self.name}'s companion: Be careful, nobody knows who is #{char.name}"
    end
  end

  def has_ring?
    if @has_ring
      puts "#{self.name}: Yes, I have, but will not show it to you"
    else
      puts "#{self.name}: No, I havent any ring"
    end
  end

  def receive_ring
    puts 'Author: Frodo got the ring'
    @has_ring = true
  end

  def ask_about_ring(char)
    puts "#{self.name}: #{char.name}, do you have the ring?"
  end

  def what_weapon(char)
    puts "#{self.name}: #{char.name}, what is your weapon?"
    puts "#{char.name}: I'm using #{char.weapon}"
  end
end


class Mortals < MiddleEarthRaces
  def initialize
    @is_alive = true
  end
end


class Immortals < MiddleEarthRaces
  def become_evil
    @is_good = false
  end
end


class Hobbit < Mortals
  include Good
  def initialize
    super
    @weapon = 'Dagger'
  end
end


class Human < Mortals
  include Good
  def initialize
    super
    @weapon = 'Sword'
  end
end


class Elf < Immortals
  include Good
  def initialize
    super
    @weapon = 'Long Bow'
  end
end


class Dwarf < Mortals
  include Good
  def initialize
    super
    @weapon = 'Axe'
  end
end


class Mayar < Immortals
  include Good
  include Evil
  def initialize
    super
    @is_good = true
    @weapon = 'Magic Staff'
  end
end


class Orc < Mortals
  include Evil
  def initialize
    super
    @is_good = false
    @weapon = 'Hummer'
  end
end