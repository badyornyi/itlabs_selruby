module HelperMethods

  def register_user(login)
    if login
      @login = login
    else
      @login = 'my_test_user_' + rand(999).to_s
    end

    hash = {
        :user_login => @login,
        :user_password => 'password',
        :user_password_confirmation => 'password',
        :user_firstname => 'first name',
        :user_lastname => 'last name',
        :user_mail => @login + '@mail.test'
    }
    hash.each_pair do |key, value|
      @driver.find_element(:id => key.to_s).send_keys value
    end
    @driver.find_element(:name => 'commit').click
  end

end