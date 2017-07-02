Given(/^on Registration page$/) do
  visit(RegisterPage)
end

When(/^I submit registration form with valid data$/) do
  on(RegisterPage).register_user(@user)
end