Given(/^on Log in page$/) do
  @driver.get 'http://demo.redmine.org/login'
end

When(/^I submit user: (.*)\/(.*)$/) do |login, password|
  @driver.find_element(:id => 'username').send_keys login
  @driver.find_element(:id => 'password').send_keys password
  @driver.find_element(:name => 'login').click
end

Then(/^I am logged in$/) do
  current_login = @driver.find_element(:css => '#loggedas .user').text
  expect(current_login).to eql @login
end

Then(/^I see error message: (.*)$/) do |message|
  error_text = @driver.find_element(:id => 'flash_error').text
  expect(error_text).to eql message
end