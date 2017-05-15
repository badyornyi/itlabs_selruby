Given(/^on Log in page$/) do
  @driver.get 'http://demo.redmine.org/login'
end

When(/^I submit user: (.*)\/(.*)$/) do |login, password|
  log_in(login, password)
end

And(/^I submit login form with valid data$/) do
  step 'on Log in page'
  step "I submit user: #{@login}\/password"
  #log_in(@login, @password)
end

Then(/^I am logged in$/) do
  current_login = @driver.find_element(:css => '#loggedas .user.active').text
  expect(current_login).to eql @login
end

Then(/^I see error message: (.*)$/) do |message|
  error_text = @driver.find_element(:id => 'flash_error').text
  expect(error_text).to eql message
end