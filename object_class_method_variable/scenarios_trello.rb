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
user = User.new
user.register


#boards
#create 4 different boards
board_1st = Board.new
board_2nd = Board.new
board_3rd = Board.new
board_4th = Board.new

#mark 1st board as favorite
board_1st.mark_favorite

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
board_1st.add_list(list_1st)
board_1st.add_list(list_2nd)
board_1st.add_list(list_3rd)
board_1st.add_list(list_4th)

#copy 1st list
board_1st.copy_list(list_1st, 'new_list_name')

#rename 2nd list
board_1st.rename_list(list_2nd, 'new_list_name')

#move 3rd list to 3rd board
board_1st.move_list(board_3rd,list_3rd,position)

#archive 4th list
board_1st.archive(list_4th)


#cards
#add 4 cards to 1st list
card_1st = Card.new
card_2nd = Card.new
card_3rd = Card.new
card_4th = Card.new
list_1st.add_card(card_1st)
list_1st.add_card(card_2nd)
list_1st.add_card(card_3rd)
list_1st.add_card(card_4th)

#rename 1st card
list_1st.rename_card(card_1st, 'new_card_name')

#copy 2nd card to 2nd list
list_1st.copy_card(card_2nd,new_card_name_opt,board_def_same,list_def_same,postion_def_1)

#move 3rd card to 3rd list on 3rd board
list_1st.move_card(card_3rd,board_def_same,list_def_same,postion_def_1)

#archive 4th card
list_1st.archive_card(card_4th)


#comments
#add comment to 1st card
comment = Comment.new
board_1st.add_comment_to_card(list_1st,card_1st,'comment_text')

#edit comment to 1st card
board_1st.edit_comment_to_card(list_1st,card_1st,comment,'new_comment_text')

#delete comment to 1st card
board_1st.delete_comment_to_card(list_1st,card_1st,comment)