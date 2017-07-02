require 'selenium-webdriver'

Before do
  @profile = Selenium::WebDriver::Firefox::Profile.new
  @profile['reader.parse-on-load.enabled'] = false

  @browser = Selenium::WebDriver.for :firefox, :profile => @profile, :desired_capabilities => {:marionette => false}
  @wait = Selenium::WebDriver::Wait.new(:timeout => 10)

  @user = Hash.new
  login = 'login_' + rand(9999).to_s
  @user = {
    :login => login,
    :password => login,
    :first_name => login,
    :last_name => login,
    :email => login + '@mail.com'
  }
end

After do
  @browser.quit
end