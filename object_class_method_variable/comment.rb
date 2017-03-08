require 'faker'

class Comment
  def initialize
    @comment_text = Faker::ChuckNorris.fact
  end


end