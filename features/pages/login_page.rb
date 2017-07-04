class LoginPage < HomePage
  include PageObject

  page_url DEFAULT_PAGE + '/login'

  ### Elements

  text_field(:login, id: 'username')
  text_field(:password, id: 'password')
  button(:submit, name: 'login')


  ### Methods

  def log_in(login, password)
    self.login = login
    self.password = password
    submit
  end

end