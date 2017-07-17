And(/^I open Projects page$/) do
  visit(ProjectsPage)
end

When(/^I open New Project creation form$/) do
  on(ProjectsPage).add_new_item
end

And(/^I submit Project Creation form with valid data$/) do
  on(NewProjectPage).create_project(@project)
end

And(/^I see created project in Projects List$/) do
  visit(ProjectsPage)
  expect(on(ProjectsPage).projects_titles_elements.map(&:text)).to include(@project[:name])
end

When(/^I create new project$/) do
  visit(ProjectsPage).add_new_item
  on(NewProjectPage).create_project(@project)
end

And(/^I open Members project tab$/) do
  on(ProjectSettingsPage).members_tab
end

And(/^I open Versions project tab$/) do
  on(ProjectSettingsPage).versions_tab
end

And(/^I add user (.*) to the project$/) do |user_name|
  on(ProjectSettingsPage).add_member_to_project(user_name)
end

Then(/^I see user (.*) in the members list$/) do |user_name|
  member_name = user_name + ' ' + user_name
  expect(on(ProjectSettingsPage).members_names_elements.map(&:text)).to include(member_name)
end

And(/^I add user (.*) to the project with role (.*)$/) do |user_name, role_name|
  on(ProjectSettingsPage).add_member_to_project(user_name,role_name)
end

# And(/^I change user (.*) role to (.*)$/) do |user_name, role_name|
#   name_index = member_role_resolve_name(user_name)
#   edit_member_role_click(name_index)
#   edit_member_role_uncheck(name_index)
#   edit_member_role_check(name_index,role_name)
#   edit_member_role_submit(name_index)
# end
#
# Then(/^I see user (.*) in the members list with role (.*)$/) do |user_name, role_name|
#   name_index = member_role_resolve_name(user_name)
#
#   @wait.until {@driver.find_elements(:css => '.roles span')[name_index].displayed?}
#   actual_new_role = @driver.find_elements(:css => '.roles span')[name_index].text
#   expect(actual_new_role).to eql(role_name)
# end

And(/^I submit Project Version Creation form with valid data$/) do
  on(ProjectSettingsPage).add_project_version(@project[:name])
end

And(/^I create new project version$/) do
  on(ProjectSettingsPage).versions_tab
  on(ProjectSettingsPage).add_project_version(@project[:name])
end