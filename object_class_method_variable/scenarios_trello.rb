require_relative 'user'
require_relative 'board'
require_relative 'list'
require_relative 'card'

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
user = User.new
user.register
user.login


#boards
#create 4 different boards
board_1st = Board.new
board_2nd = Board.new
board_3rd = Board.new
board_4th = Board.new

#mark 1st board as favorite
board_1st.favorite

#rename 2nd board
board_2nd.rename('new_name')

#delete 4th board
board_4th.delete


#lists
#create 4 lists on 1st board
list_1st = List.new
list_2nd = List.new
list_3rd = List.new
list_4th = List.new
board_1st.create_list(list_1st)
board_1st.create_list(list_2nd)
board_1st.create_list(list_3rd)
board_1st.create_list(list_4th)


#copy 1st list
board_1st.copy_list
list_1st.copy(list_name)
list_copy
#rename 2nd list

list_2nd.rename(list_name)
list_rename

#move 3rd list to 3rd board
list_3rd.move(board,position)
list_move

#archive 4th list
list_4th.archive
list_archive

#cards
#add 4 cards to 1st list
card_1st = Card.new
card_2nd = Card.new
card_3rd = Card.new
card_4th = Card.new
card_create

#rename 1st card
card_1st.rename(card_name)
card_rename

#copy 2nd card to 2nd list
card_2nd.copy(card_name,board,list,postion)
card_copy

#move 3rd card to 3rd list on 3rd board
card_3rd.move(board,list,postion)
card_move

#archive 4th card
card_4th.archive
card_archive


#comments
#add comment to 1st card
#card_1st.comment_add
comment = Comment.new
comment_add

#edit comment to 1st card
#card_1st.comment_edit
comment.edit
comment_edit

#delete comment to 1st card
#card_1st.comment_delete
comment.delete
comment_delete