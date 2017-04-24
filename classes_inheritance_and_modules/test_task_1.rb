require 'test/unit'
require 'rspec'
require_relative 'task_1'


class TestTask1 < Test::Unit::TestCase
  include RSpec::Matchers

  def test_public_eat_lvl1
    bird = Bird.new
    bird.animal_name = 'Crow'

    expected_food = 'corn'
    actual_food = bird.eat
    expect(actual_food).to eql(expected_food)
  end

  def test_public_walk_lvl2
    reptile = Reptile.new
    reptile.animal_name = 'Lizard'

    actual_is_walking = reptile.walk
    expect(actual_is_walking).to be true
  end

  def test_public_fly_lvl3
    bird = Bird.new
    bird.animal_name = 'Crow'

    actual_is_flying = bird.fly
    expect(actual_is_flying).to be true
  end

  def test_protected_correct_call
    reptile = Reptile.new
    reptile.animal_name = 'Lizard'
    fish = Fish.new
    fish.animal_name = 'Shark'

    expected_food = 'other animals'
    actual_food = fish.what_eats(reptile)
    expect(actual_food).to eql(expected_food)
  end

  def test_protected_incorrect_call
    bird = Bird.new
    bird.animal_name = 'Crow'

    expected_food = 'corn'
    actual_food = what_eats(bird)
    expect(actual_food).to eql(expected_food)
  end

  def test_private_going_sleep
    reptile = Reptile.new
    reptile.animal_name = 'Lizard'

    actual_is_went_sleep = reptile.going_sleep
    expect(actual_is_went_sleep).to be true
  end
end