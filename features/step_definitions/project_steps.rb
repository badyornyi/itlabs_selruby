And(/^I open Projects page$/) do
  visit(ProjectsPage)
end

When(/^I open New Project creation form$/) do
  on(ProjectsPage).new_project
end

And(/^I submit Project Creation form with valid data$/) do
  project = @project
  on(NewProjectPage).create_project(project)
end

And(/^I see created project in Projects List$/) do
  visit(ProjectsPage)
  project_name = @project[:name]
  result = on(ProjectsPage).projects_titles_elements.map(&:text).include? project_name
  expect(result).to be(true)
end

When(/^I create new project$/) do
  visit(ProjectsPage).new_project
  project = @project
  on(NewProjectPage).create_project(project)
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
  result = on(ProjectSettingsPage).members_names_elements.map(&:text).include? member_name
  expect(result).to be(true)
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
  project_name = @project[:name]
  on(ProjectSettingsPage).add_project_version(project_name)
end

And(/^I create new project version$/) do
  on(ProjectSettingsPage).versions_tab
  project_name = @project[:name]
  on(ProjectSettingsPage).add_project_version(project_name)
end