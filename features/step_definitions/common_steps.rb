Given(/^on Main page$/) do
  @driver.get 'http://demo.redmine.org/'
end

When(/^I click (.*) button$/) do |button|
  click(button)
end

When(/^I open (.*) page$/) do |page_name|
  page_address = get_page_address(page_name)
  @driver.get "http://demo.redmine.org/#{page_address}"
end