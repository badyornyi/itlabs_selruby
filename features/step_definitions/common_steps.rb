Given(/^on Main page$/) do
  visit(HomePage)
end

Then(/^I see success message$/) do
  expect(on(HomePage).success_message?).to be(true)
end

Then(/^I see error message$/) do
  expect(on(HomePage).error_message?).to be(true)
end