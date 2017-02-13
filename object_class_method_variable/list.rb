require 'faker'
class List
  def initialize
    @list_title = Faker::GameOfThrones.house
  end
end