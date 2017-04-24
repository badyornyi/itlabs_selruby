require 'test/unit'
require 'faker'
require 'rspec'
require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'
require_relative 'comment'

class TestTrello < Test::Unit::TestCase
  include RSpec::Matchers

  def setup
    @login = Faker::Internet.user_name
    @board_title = Faker::Color.color_name.capitalize + ' Board'
  end

  def test_user_register
    user = User.new(@login)
    user.register

    expect(user.login).to eql(@login)
  end

  def test_board_create
    user = User.new(@login)
    user.register

    board = user.create_board(@board_title)

    expect(board.title).to eql(@board_title)
  end

  def test_board_mark_as_favorite
    user = User.new(@login)
    user.register
    board = user.create_board(@board_title)

    board.mark_favorite

    expect(board.is_favorite).to be true
  end

  def test_board_rename
    user = User.new(@login)
    user.register
    board = user.create_board(@board_title)

    new_title = 'New Board Title'
    board.rename(new_title)

    expect(board.title).to eql(new_title)
  end
end