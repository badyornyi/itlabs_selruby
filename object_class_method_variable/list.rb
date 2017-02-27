require 'faker'
class List
  def initialize
    @list_title = Faker::GameOfThrones.house
  end

  def add_card(card)
    # code here
  end

  def rename_card(card, new_card_name)
    # code here
  end

  def copy_card(card, new_card_name_opt, board_def_same, list_def_same, postion_def_1)
    # code here
  end

  def move_card(card, board_def_same, list_def_same, postion_def_1)
    # code here
  end

  def archive_card(card)
    # code here
  end
end