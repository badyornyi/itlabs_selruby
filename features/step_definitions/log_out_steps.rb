When(/^I am logging out$/) do
  on(HomePage).log_out
end

When(/^I open User Account page$/) do
  open_page_user_account
end

Then(/^I see main page with possibility to log in$/) do
  expect(on(HomePage).log_in?).to be(true)
end