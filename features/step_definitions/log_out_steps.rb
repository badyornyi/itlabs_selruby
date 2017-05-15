Then(/^I see main page with Login button$/) do
  @wait.until {@driver.find_element(:class => 'login').displayed?}
  login_button = @driver.find_element(:class => 'login')

  expect(login_button).to be
end