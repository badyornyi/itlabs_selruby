Given(/^on Main page$/) do
  @driver.get 'http://demo.redmine.org/'
end

When(/^I click (.*) button$/) do |button|
  click(button)
end
