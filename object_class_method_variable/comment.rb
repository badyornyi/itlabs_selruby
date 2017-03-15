require 'faker'

class Comment
  def initialize
    @text = Faker::ChuckNorris.fact
  end


end