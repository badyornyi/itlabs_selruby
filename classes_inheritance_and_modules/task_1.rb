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
    what_eat = animal.food_type
    what_eat
  end

  def eat
    food = food_type
    puts "#{animal_name.capitalize} is eating #{food} now"
    food
  end

  def sleep
    puts "#{animal_name.capitalize} sleeps"
    is_sleeping = true
    is_sleeping
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
    is_swim = true
    is_swim
  end
end


class Tetrapod < Animal
  def night_sleeping
    going_sleep
    3.times do
      sleep
    end
    wake_up
    is_slept_already = true
    is_slept_already
  end

  def walk
    puts "#{animal_name.capitalize} walks"
    is_walking = true
    is_walking
  end

# private methods
  private
  def going_sleep
    puts "#{animal_name.capitalize} is going sleep"
    is_went_sleep = true
    is_went_sleep
  end

  def wake_up
    puts "#{animal_name.capitalize} waked up"
    is_waked_up = true
    is_waked_up
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
    is_flying = true
    is_flying
  end
end


class Reptile < Tetrapod
  def initialize
    @animal_class = 'reptile'
  end

  def run
    puts "#{animal_name.capitalize} running"
    is_running = true
    is_running
  end

  def hunt
    puts "#{animal_name.capitalize} hunting"
    is_hunting = true
    is_hunting
  end
end