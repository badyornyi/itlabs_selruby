class LoginPage < HomePage
  include PageObject

  page_url DEFAULT_PAGE + '/login'

  ### Elements

  text_field(:login, id: 'username')
  button(:submit_login, name: 'login')


  ### Methods

  def log_in(login, password)
    self.login = login
    self.password = password
    submit_login
  end

end