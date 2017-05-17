And(/^I open Change Password page$/) do
  open_page_password
end

When(/^I input my old password$/) do
  password_input
end

And(/^I input my new password$/) do
  password_input_new
end

And(/^I submit password change$/) do
  password_change_commit
end