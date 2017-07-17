class PasswordPage < HomePage
  include PageObject

  page_url DEFAULT_PAGE + '/my/password'

  ### Elements

  text_field(:new_password, id: 'new_password')
  text_field(:new_password_confirm, id: 'new_password_confirmation')


  ### Methods

  def change_password(old_password,new_password)
    self.password = old_password
    self.new_password = new_password
    self.new_password_confirm = new_password
    submit
  end

end