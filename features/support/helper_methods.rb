module HelperMethods

  # Common methods

  def click(button_name)
    button = button_name.downcase
    @wait.until {@driver.find_element(:class => "#{button}").displayed?}
    @driver.find_element(:class => "#{button}").click
  end

  # Work with users

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

  def log_in(login, password)
    @login = login
    @wait.until {@driver.find_element(:id => 'username').displayed?}
    @driver.find_element(:id => 'username').send_keys @login
    @driver.find_element(:id => 'password').send_keys password
    @driver.find_element(:name => 'login').click
  end


end