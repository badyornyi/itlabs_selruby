And(/^I open Change Password page$/) do
  visit(PasswordPage)
end

When(/^I change my password$/) do
  old_password = @user[:password]
  new_password = old_password + '_new'
  @user[:password] = new_password
  on(PasswordPage).change_password(old_password,new_password)
end