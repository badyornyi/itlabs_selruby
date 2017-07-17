require 'page-object'

class HomePage
  include PageObject

  DEFAULT_PAGE = 'http://demo.redmine.org'
  page_url DEFAULT_PAGE

  ### Common elements

  link(:log_in, class: 'login')
  link(:log_out, class: 'logout')
  div(:logged_in, id: 'loggedas')

  link(:add_new_item, class: 'icon icon-add')
  text_field(:password, id: 'password')
  button(:submit, name: 'commit')

  div(:success_message, id: 'flash_notice')
  div(:error_message, id: 'flash_error')
end