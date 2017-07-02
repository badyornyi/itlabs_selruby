require 'page-object'

class HomePage
  include PageObject

  DEFAULT_PAGE = 'http://demo.redmine.org'
  page_url DEFAULT_PAGE

  ### Elements

  div(:logged_in, id: 'loggedas')
  div(:success_message, id: 'flash_notice')
  div(:error_message, id: 'flash_error')
end