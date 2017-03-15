require 'test/unit'
require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'
require_relative 'comment'

class TestTrello < Test::Unit::TestCase

  def test_user_register
    user = User.new('first_user')
    user.register

    expected_user = user.full_name
    actual_user = user.full_name
    assert_equal(expected_user,actual_user)
  end

  def test_board_create
    user = User.new('first_user')
    user.register

    board = user.create_board

    expected_boar_title = board.title
    actual_boar_title = board.title
    assert_equal(expected_boar_title,actual_boar_title)
  end

  def test_board_mark_as_favorite
    user = User.new('first_user')
    user.register
    board = user.create_board

    board.mark_favorite

    is_fav = board.is_favorite
    assert_equal(is_fav,true)
  end

  def test_board_rename
    user = User.new('first_user')
    user.register
    board = user.create_board
    new_title = 'New Board Title'

    board.rename(new_title)
    assert_equal(new_title,board.title)
  end
end