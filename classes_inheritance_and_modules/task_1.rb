#1. Go through methods lesson and demos once again.
# Then create 5 simple classes structure with 3 inheritance levels
# and write unit tests which demonstrate
# different methods availability levels (public, private, protected)

#=============#
#lvl 1
class Animal
  attr_accessor :animal, :animal_class

  private def food_type
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

  def eat
    food = food_type
    puts "#{animal.capitalize} is eating #{food} now"
  end

  def sleep
    puts "#{animal.capitalize} sleeps"
  end
end

#=============#
#lvl 2
class Fish < Animal
  def initialize
    @animal_class = 'fish'
  end

  def swim
    puts "#{animal.capitalize} swims"
  end
end


class Tetrapod < Animal
  private def going_sleep
    puts "#{animal.capitalize} is going sleep"
  end

  private def wake_up
    puts "#{animal.capitalize} waked up"
  end

  def night_sleeping
    going_sleep
    3.times do
      sleep
    end
    wake_up
  end

  def walk
    puts "#{animal.capitalize} walks"
  end
end

#=============#
#lvl3
class Bird < Tetrapod
  def initialize
    @animal_class = 'bird'
  end

  def fly
    puts "#{animal.capitalize} flies"
  end
end


class Reptile < Tetrapod
  def initialize
    @animal_class = 'reptile'
  end

  def run
    puts "#{animal.capitalize} running"
  end

  def hunt
    puts "#{animal.capitalize} hunting"
  end
end

bird = Bird.new
bird.animal = 'Crow'
reptile = Reptile.new
reptile.animal = 'Lizard'
fish = Fish.new
fish.animal = 'Shark'

bird.eat
bird.fly
#bird.going_sleep      #will cause NoMethodError
bird.night_sleeping

#reptile.wake_up       #will cause NoMethodError
reptile.walk
reptile.run
reptile.hunt
reptile.eat

fish.eat
fish.swim
#fish.food_type        #will cause NoMethodError