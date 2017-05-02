Given(/^on Registration page$/) do
  @driver.get 'http://demo.redmine.org'
  @driver.find_element(:class => 'register').click
end

When(/^I submit registration form with valid data$/) do
  register_user(nil)
end

Then(/^I see message "([^"]*)"$/) do |message|
  message_text = @driver.find_element(:id => 'flash_notice').text
  expect(message_text).to eql message
end