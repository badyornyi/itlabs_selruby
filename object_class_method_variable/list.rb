require 'faker'

class List

  attr_reader :list_title

  def initialize
    @list_title = 'House of ' + Faker::GameOfThrones.house
  end


end