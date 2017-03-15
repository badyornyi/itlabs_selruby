require 'faker'

class List

  attr_reader :title

  def initialize
    @title = 'House of ' + Faker::GameOfThrones.house
  end


end