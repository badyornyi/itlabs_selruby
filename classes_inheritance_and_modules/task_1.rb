#1. Go through methods lesson and demos once again.
# Then create 5 simple classes structure with 3 inheritance levels
# and write unit tests which demonstrate
# different methods availability levels (public, private, protected)

#=============#
#lvl 1
class Animal
  attr_accessor :animal_name, :animal_class

  def what_eats(animal)
    puts "#{animal.animal_class.capitalize + 's'} eat #{animal.food_type}"
    animal.food_type
  end

  def eat
    food = food_type
    puts "#{animal_name.capitalize} is eating #{food} now"
    food
  end

  def sleep
    puts "#{animal_name.capitalize} sleeps"
    true
  end

# protected method
  protected
  def food_type
    case animal_class
      when 'bird'
        food = 'corn'
      when 'fish'
        food = 'water plants'
      when 'reptile'
        food = 'other animals'
      else
        raise 'This is unknown animal'
    end
    food
  end
end

#=============#
#lvl 2
class Fish < Animal
  def initialize
    @animal_class = 'fish'
  end

  def swim
    puts "#{animal_name.capitalize} swims"
    true
  end
end


class Tetrapod < Animal
  def night_sleeping
    going_sleep
    3.times do
      sleep
    end
    wake_up
    true
  end

  def walk
    puts "#{animal_name.capitalize} walks"
    true
  end

# private methods
  private
  def going_sleep
    puts "#{animal_name.capitalize} is going sleep"
    true
  end

  def wake_up
    puts "#{animal_name.capitalize} waked up"
    true
  end
end

#=============#
#lvl3
class Bird < Tetrapod
  def initialize
    @animal_class = 'bird'
  end

  def fly
    puts "#{animal_name.capitalize} flies"
    true
  end
end


class Reptile < Tetrapod
  def initialize
    @animal_class = 'reptile'
  end

  def run
    puts "#{animal_name.capitalize} running"
    true
  end

  def hunt
    puts "#{animal_name.capitalize} hunting"
    true
  end
end