require 'faker'
class Board
  def initialize
    @board_title = Faker::Color.color_name
  end

  def mark_favorite
    # mark as favorite
  end

  def rename(new_name)
    # rename board
  end

  def delete
    #delete board
  end

  def add_list(list)
    # create list on the board
  end

  def copy_list(list, new_list_name)
    return new_list
  end

  def rename_list(list, new_list_name)
    # code here
  end

  def move_list(dest_board, list, position)
    # code here
  end

  def archive(list)
    # code here
  end

  def add_comment_to_card(list, card, comment_text)
    # code here
  end

  def edit_comment_to_card(list, card, comment, comment_text)
    # code here
  end

  def delete_comment_to_card(list, card, comment)
    # code here
  end
end