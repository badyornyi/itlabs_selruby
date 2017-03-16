require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'
require_relative 'comment'

#1.Please create few integrated simple models for trello.com
#Should be at least:
#-users
#-boards
#-lists
#-cards
#-comments
#Create 10 any unit tests for this classes and their methods

#uses
#create user
user1 = User.new('first_user')
user1.register


#boards
#create 4 different boards
board1 = user1.create_board
board2 = user1.create_board
board4 = user1.create_board

#mark 1st board as favorite
board1.mark_favorite

#rename 2nd board
board2.rename('New Board Title')

#delete 4th board
board4.close


#lists
#create 4 lists on 1st board
board1.add_list

#===============================================
#copy 1st list
#rename 2nd list
#move 3rd list to 3rd board
#archive 4th list


#cards
#add 4 cards to 1st list
#rename 1st card
#copy 2nd card to 2nd list
#move 3rd card to 3rd list on 3rd board
#archive 4th card


#comments
#add comment to 1st card
#edit comment to 1st card
#delete comment to 1st card