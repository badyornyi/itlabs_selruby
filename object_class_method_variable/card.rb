require 'faker'

class Card
  def initialize
    @title = Faker::GameOfThrones.character
  end


end