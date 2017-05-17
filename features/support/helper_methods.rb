module HelperMethods

  ### Common methods

  ### Navigation methods

  def open_page_main
    @driver.get 'http://demo.redmine.org/'
  end

  def open_page_login
    open_page_main
    @wait.until {@driver.find_element(:class => 'login').displayed?}
    @driver.find_element(:class => 'login').click
  end

  def open_page_registration
    open_page_main
    @wait.until {@driver.find_element(:class => 'register').displayed?}
    @driver.find_element(:class => 'register').click
  end

  def open_page_user_account
    #open_page_main
    @wait.until {@driver.find_element(:class => 'my-account').displayed?}
    @driver.find_element(:class => 'my-account').click
  end

  def open_page_password
    @wait.until {@driver.find_element(:css => '.icon.icon-passwd').displayed?}
    @driver.find_element(:css => '.icon.icon-passwd').click
  end


  ### Users methods

  def register_user(login)
    if login
      @login = login
    else
      @login = 'my_test_user_' + rand(999).to_s
    end
    @password = @login + '_pwd'
    hash = {
        :user_login => @login,
        :user_password => @password,
        :user_password_confirmation => @password,
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

  def password_input
    @wait.until {@driver.find_element(:id => 'password').displayed?}
    @driver.find_element(:id => 'password').send_keys(@password)
  end

  def password_input_new
    @password = @password + '_new'
    @driver.find_element(:id => 'new_password').send_keys(@password)
    @driver.find_element(:id => 'new_password_confirmation').send_keys(@password)
  end

  def password_change_commit
    @driver.find_element(:name => 'commit').click
  end


  ### Projects -> Project methods


end