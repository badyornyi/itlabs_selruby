require 'test/unit'
require 'faker'
require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'
require_relative 'comment'

class TestTrello < Test::Unit::TestCase

  def setup
    @login = Faker::Internet.user_name
    @board_title = Faker::Color.color_name.capitalize + ' Board'
  end

  def test_user_register
    user = User.new(@login)
    user.register

    assert_equal(@login,user.login)
  end

  def test_board_create
    user = User.new(@login)
    user.register

    board = user.create_board(@board_title)

    assert_equal(@board_title,board.title)
  end

  def test_board_mark_as_favorite
    user = User.new(@login)
    user.register
    board = user.create_board(@board_title)

    board.mark_favorite

    assert_equal(true,board.is_favorite)
  end

  def test_board_rename
    user = User.new(@login)
    user.register
    board = user.create_board(@board_title)

    new_title = 'New Board Title'
    board.rename(new_title)

    assert_equal(new_title,board.title)
  end
end