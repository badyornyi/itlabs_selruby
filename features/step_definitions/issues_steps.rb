When(/^I submit New Issue form with valid data and issue type (.*)$/) do |issue_type|
  @issue_subject = on(ProjectSettingsPage).add_new_issue(issue_type)
end

And(/^I open Issues page$/) do
  on(ProjectSettingsPage).issues_tab
end

Then(/^I see created issue in the list$/) do
  expect(on(ProjectSettingsPage).issue_subjects_elements.map(&:text)).to include(@issue_subject)
end

And(/^I start to watch issue$/) do
  on(ProjectSettingsPage).start_watch
end

Then(/^I can see that issue is watched$/) do
  expect(on(ProjectSettingsPage).issue_watched?).to be
end