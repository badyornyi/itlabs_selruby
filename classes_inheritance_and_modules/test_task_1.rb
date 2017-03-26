require 'test/unit'
require_relative 'task_1'


class TestTask1 < Test::Unit::TestCase
  def test_public_eat_lvl1
    bird = Bird.new
    bird.animal_name = 'Crow'

    expected_food = 'corn'
    actual_food = bird.eat
    assert_equal(expected_food,actual_food)
  end

  def test_public_walk_lvl2
    reptile = Reptile.new
    reptile.animal_name = 'Lizard'

    expected_is_walking = true
    actual_is_walking = reptile.walk
    assert_equal(expected_is_walking,actual_is_walking)
  end

  def test_public_fly_lvl3
    bird = Bird.new
    bird.animal_name = 'Crow'

    expected_is_flying = true
    actual_is_flying = bird.fly
    assert_equal(expected_is_flying,actual_is_flying)
  end

  def test_protected_correct_call
    reptile = Reptile.new
    reptile.animal_name = 'Lizard'
    fish = Fish.new
    fish.animal_name = 'Shark'

    expected_food = 'other animals'
    actual_food = fish.what_eats(reptile)
    assert_equal(expected_food,actual_food)
  end

  def test_protected_incorrect_call
    bird = Bird.new
    bird.animal_name = 'Crow'

    expected_food = 'corn'
    actual_food = what_eats(bird)
    assert_equal(expected_food,actual_food)
  end

  def test_private_going_sleep
    reptile = Reptile.new
    reptile.animal_name = 'Lizard'

    expected_is_went_sleep = true
    actual_is_went_sleep = reptile.going_sleep
    assert_equal(expected_is_went_sleep,actual_is_went_sleep)
  end
end