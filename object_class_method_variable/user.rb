require 'faker'
require_relative 'board'

class User

  attr_reader :login, :first_name, :last_name, :full_name, :email, :password

  def initialize(login)
    @login = login
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @full_name = @first_name + ' ' + @last_name
    @email = Faker::Internet.email(@full_name)
    @password = @first_name + @last_name + rand(9999).to_s
  end

  def register
    puts "User #{@full_name} is registered"
    puts "Login: #{@login}; Password: #{@password}"
  end

  def create_board(title)
    board = Board.new(title)
    puts "New board '#{board.title}' created"
    board
  end


end