When(/^I click Logout button$/) do
  @wait.until {@driver.find_element(:class => 'logout').displayed?}
  @driver.find_element(:class => 'logout').click
end

When(/^I open User Account page$/) do
  open_page_user_account
end

Then(/^I see main page with Login button$/) do
  @wait.until {@driver.find_element(:class => 'login').displayed?}
  login_button = @driver.find_element(:class => 'login')

  expect(login_button).to be
end