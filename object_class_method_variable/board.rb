require 'faker'
require_relative 'list'

class Board

  attr_reader :title, :is_favorite, :is_closed

  def initialize
    @title = Faker::Color.color_name.capitalize + ' Board'
    @is_favorite = false
    @is_closed = false
  end

  def mark_favorite
    @is_favorite = true
    puts "Board '#{@title}' is marked as favorite"
  end

  def rename(new_title)
    old_title = @title
    @title = new_title
    puts "Board '#{old_title}' is renamed to '#{@title}'"
  end

  def close
    @is_closed = true
    puts "Board '#{@title}' is closed successfully"
  end

  def add_list
    list = List.new
    puts "List '#{list.title}' is added to board '#{@title}' successfully"
    list
  end
end