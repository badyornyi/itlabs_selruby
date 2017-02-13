require 'faker'
class Board
  def initialize
    @board_title = Faker::Color.color_name
  end
end