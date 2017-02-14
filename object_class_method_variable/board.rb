require 'faker'
class Board
  def initialize
    @board_title = Faker::Color.color_name
  end

  def favorite
    # mark as favorite
  end

  def rename(new_name)
    # rename board
  end

  def delete
    #delete board
  end

  def create_list(list)
    # create list on the board
  end
end