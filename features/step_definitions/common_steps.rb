Given(/^on Main page$/) do
  open_page_main
end

Then(/^I see message "([^"]*)"$/) do |message|
  message_text = @driver.find_element(:id => 'flash_notice').text
  expect(message_text).to eql message
end

Then(/^I see error message: (.*)$/) do |message|
  error_text = @driver.find_element(:id => 'flash_error').text
  expect(error_text).to eql message
end