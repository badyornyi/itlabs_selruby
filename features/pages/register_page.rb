class RegisterPage < HomePage
  include PageObject

  page_url DEFAULT_PAGE + '/account/register'

  ### Elements

  text_field(:login, id: 'user_login')
  text_field(:password, id: 'user_password')
  text_field(:password_confirm, id: 'user_password_confirmation')
  text_field(:first_name, id: 'user_firstname')
  text_field(:last_name, id: 'user_lastname')
  text_field(:email, id: 'user_mail')
  button(:submit, name: 'commit')


  ### Methods

  def register_user(user)
    self.login = user[:login]
    self.password = user[:password]
    self.password_confirm = user[:password]
    self.first_name = user[:first_name]
    self.last_name = user[:last_name]
    self.email = user[:email]
    submit
  end

end