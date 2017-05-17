Given(/^on Registration page$/) do
  open_page_registration
end

When(/^I submit registration form with valid data$/) do
  register_user(nil)
end