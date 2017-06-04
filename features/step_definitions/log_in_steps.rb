Given(/^on Log in page$/) do
  open_page_login
end

When(/^I submit user: (.*)\/(.*)$/) do |login, password|
  log_in(login, password)
end

And(/^I submit login form with valid data$/) do
  open_page_login
  log_in(@login, @password)
end

Then(/^I am logged in$/) do
  current_login = @driver.find_element(:css => '#loggedas .user.active').text
  expect(current_login).to eql @login
end