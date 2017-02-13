require 'faker'
class User
  def initialize
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @email = Faker::Internet.email(@first_name + @last_name)
    @password = @first_name + @last_name
  end
end