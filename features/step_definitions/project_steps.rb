And(/^I open Projects page$/) do
  open_page_projects
end

When(/^I open New Project creation form$/) do
  project_new_project
end

And(/^I submit Project Creation form with valid data$/) do
  project_create_name
  project_fill_form
  project_commit_form
end

When(/^I create new project$/) do
  project_create_new_project
end

And(/^I open Members project tab$/) do
  open_tab_proj_members
end

And(/^I open Versions project tab$/) do
  open_tab_versions
end

And(/^I add user (.*) to the project$/) do |user_name|
  members_add_user_to_proj(user_name)
  members_set_user_role
  members_add_user_submit
end

Then(/^I see user (.*) in the members list$/) do |user_name|
  name_index = member_role_resolve_name(user_name)

  @wait.until {@driver.find_elements(:css => '.name.user')[name_index].displayed?}

  expected_added_user = (user_name + ' ' + user_name)
  actual_added_user = @driver.find_elements(:css => '.name.user')[name_index].text
  expect(actual_added_user).to eql(expected_added_user)
end

And(/^I add user (.*) to the project with role (.*)$/) do |user_name, role_name|
  members_add_user_to_proj(user_name)
  members_set_user_role(role_name)
  members_add_user_submit
end

And(/^I change user (.*) role to (.*)$/) do |user_name, role_name|
  name_index = member_role_resolve_name(user_name)
  edit_member_role_click(name_index)
  edit_member_role_uncheck(name_index)
  edit_member_role_check(name_index,role_name)
  edit_member_role_submit(name_index)
end

Then(/^I see user (.*) in the members list with role (.*)$/) do |user_name, role_name|
  name_index = member_role_resolve_name(user_name)

  @wait.until {@driver.find_elements(:css => '.roles span')[name_index].displayed?}
  actual_new_role = @driver.find_elements(:css => '.roles span')[name_index].text
  expect(actual_new_role).to eql(role_name)
end

And(/^I open New Project Version creation form$/) do
  version_add_new_click
end

And(/^I submit Project Version Creation form with valid data$/) do
  version_add_new_fill_form
  version_add_new_commit
end

And(/^I create new project version$/) do
  open_tab_versions
  version_create_new_version
end