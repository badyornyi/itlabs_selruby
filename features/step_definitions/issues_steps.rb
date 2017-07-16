When(/^I submit New Issue form with valid data and issue type (.*)$/) do |issue_type|
  @issue_subject = on(ProjectSettingsPage).add_new_issue(issue_type)
end

And(/^I open Issues page$/) do
  on(ProjectSettingsPage).issues
end

Then(/^I see created issue in the list$/) do
  result = on(ProjectSettingsPage).issue_subjects_elements.map(&:text).include? @issue_subject
  expect(result).to be(true)
end

And(/^I start to watch issue$/) do
  on(ProjectSettingsPage).start_watch
end

Then(/^I can see that issue is watched$/) do
  result = on(ProjectSettingsPage).issue_watched?
  expect(result).to be(true)
end