require 'faker'
require_relative 'list'

class Board

  attr_reader :board_title, :is_favorite, :is_closed

  def initialize
    @board_title = Faker::Color.color_name.capitalize + ' Board'
    @is_favorite = false
    @is_closed = false
  end

  def board_mark_favorite
    @is_favorite = true
    puts "Board '#{@board_title}' is marked as favorite"
  end

  def board_rename(new_title)
    old_title = @board_title
    @board_title = new_title
    puts "Board '#{old_title}' is renamed to '#{@board_title}'"
  end

  def board_close
    @is_closed = true
    puts "Board '#{@board_title}' is closed successfully"
  end

  def list_add
    list = List.new
    puts "List '#{list.list_title}' is added to board '#{@board_title}' successfully"
    list
  end
end