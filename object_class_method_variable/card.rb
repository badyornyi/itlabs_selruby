require 'faker'
class Card
  def initialize
    @card_title = Faker::GameOfThrones.character
  end
end