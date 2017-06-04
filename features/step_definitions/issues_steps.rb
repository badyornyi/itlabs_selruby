And(/^I open New Issue creation form$/) do
  issue_add_new_click
end

When(/^I submit New Issue form with valid data and issue type (.*)$/) do |issue_type|
  issue_create_issue_fill_form(issue_type)
  issue_create_issue_commit
end

Then(/^I see successfully created issue$/) do
  @wait.until {@driver.find_element(:css => '.subject h3').displayed?}

  expected_issue_subj = @issue_subj
  actual_issue_subj = @driver.find_element(:css => '.subject h3').text
  expect(actual_issue_subj).to eql(expected_issue_subj)
end

And(/^I open Issues page$/) do
  open_page_issues
end

Then(/^I see created issue in the list$/) do
  @wait.until {@driver.find_element(:css => '.subject a').displayed?}
  issue_added_resolve_name

  expected_visible_issue = @issue_subj
  actual_visible_issue = @driver.find_elements(:css => '.subject a')[@issue_index].text
  expect(actual_visible_issue).to eql(expected_visible_issue)
end

And(/^I start to watch issue$/) do
  issue_become_watcher
end

Then(/^I can see that issue (.*) is watched$/) do |issue_type|
  @wait.until {@driver.find_element(:css => '.icon.icon-fav').displayed?}

  expected_result = {issue_type: issue_type, watching: true}
  actual_result = Hash.new
  actual_result[:issue_type] = @driver.find_element(:xpath => '//h2').text.delete(' #0123456789')
  actual_result[:watching] = issue_watched?
  expect(actual_result).to eql(expected_result)
end