When(/^I visit the Home page$/) do
  visit('/')
  ask('does that look right?')
end

Then(/^I should see a "(.*?)" link$/) do |arg1|
  expect(page).to have_link(arg1)
end
