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
  end

  def eat
    food = food_type
    puts "#{animal_name.capitalize} is eating #{food} now"
  end

  def sleep
    puts "#{animal_name.capitalize} sleeps"
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
  end
end


class Tetrapod < Animal
  def night_sleeping
    going_sleep
    3.times do
      sleep
    end
    wake_up
  end

  def walk
    puts "#{animal_name.capitalize} walks"
  end

# private methods
  private def going_sleep
    puts "#{animal_name.capitalize} is going sleep"
  end

  private def wake_up
    puts "#{animal_name.capitalize} waked up"
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
  end
end


class Reptile < Tetrapod
  def initialize
    @animal_class = 'reptile'
  end

  def run
    puts "#{animal_name.capitalize} running"
  end

  def hunt
    puts "#{animal_name.capitalize} hunting"
  end
end

bird = Bird.new
bird.animal_name = 'Crow'
reptile = Reptile.new
reptile.animal_name = 'Lizard'
fish = Fish.new
fish.animal_name = 'Shark'

# public methods tests
bird.eat
bird.fly
bird.night_sleeping

reptile.walk
reptile.run
reptile.hunt
reptile.eat

fish.eat
fish.swim

# protected methods tests
bird.what_eats(fish)
reptile.what_eats(bird)
fish.what_eats(reptile)

# private methods tests
bird.going_sleep      #will cause NoMethodError
reptile.wake_up       #will cause NoMethodError