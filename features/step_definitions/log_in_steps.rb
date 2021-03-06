Given(/^on Log in page$/) do
  visit(LoginPage)
end

When(/^I submit user: (.*)\/(.*)$/) do |login, password|
  on(LoginPage).log_in(login,password)
end

And(/^I submit login form with valid data$/) do
  visit(LoginPage).log_in(@user[:login],@user[:password])
end

Then(/^I am logged in$/) do
  expect(on(LoginPage).logged_in?).to be
end