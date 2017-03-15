require 'test/unit'
require 'faker'
require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'
require_relative 'comment'

class TestTrello < Test::Unit::TestCase


  def test_user_register
    login = Faker::Internet.user_name

    user = User.new(login)
    user.register

    assert_equal(user.login,login)
  end

  def test_board_create
    login = Faker::Internet.user_name
    board_title = Faker::Color.color_name.capitalize + ' Board'

    user = User.new(login)
    user.register

    board = user.create_board(board_title)

    assert_equal(board_title,board.title)
  end

  def test_board_mark_as_favorite
    login = Faker::Internet.user_name
    board_title = Faker::Color.color_name.capitalize + ' Board'

    user = User.new(login)
    user.register
    board = user.create_board(board_title)

    board.mark_favorite

    is_fav = board.is_favorite
    assert_equal(is_fav,true)
  end

  def test_board_rename
    login = Faker::Internet.user_name
    board_title = Faker::Color.color_name.capitalize + ' Board'

    user = User.new(login)
    user.register
    board = user.create_board(board_title)
    new_title = 'New Board Title'

    board.rename(new_title)
    assert_equal(new_title,board.title)
  end
end