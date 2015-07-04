Given(/^I visit the "(.*?)" page$/) do |arg1|
  visit("/#{arg1}")
#  puts arg1
#  ask('does that look right?')
end

Given(/^I was a registered user$/) do
  steps %{
    Given I visit the "signup" page
    When I fill in the "Name" field with "Example User"
    And  I fill in the "Email" field with "user@example.com"
    And  I fill in the "Password" field with "foobar"
    And  I fill in the "Confirm Password" field with "foobar"
    And  I click the "Create my account" button
    Then I should see the message contains "Welcome"
    And  I should see a "Account" link
    And  I sign out
  }
end

Given(/^I has signed in$/) do
  steps %{
    Given I was a registered user
    And  I click the "Sign in" link
    And  I fill in the "Email" field with "user@example.com"
    And  I fill in the "Password" field with "foobar"
    And  I click the "Sign in" button
  }
end

Given(/^I has signed in as an administrator$/) do
  User.create!(name: "Example User",
               email: "example@railstutorial.org",
               password: "foobar",
               password_confirmation: "foobar",
               admin: true)
  steps %{
    Given I visit the "signin" page
    And  I fill in the "Email" field with "example@railstutorial.org"
    And  I fill in the "Password" field with "foobar"
    And  I click the "Sign in" button
  }
end


Given(/^I sign out$/) do
  click_link("Account")
  click_link("Sign out")
end


When(/^I visit the Home page$/) do
  visit('/')
end

When(/^I fill in the "(.*?)" field with "(.*?)"$/) do |arg1, arg2|
  fill_in(arg1, with: arg2)
end

When(/^I click the "(.*?)" button$/) do |arg1|
  click_button(arg1)
end

When(/^I click the "(.*?)" link$/) do |arg1|
  click_link(arg1)
end

Then(/^I should see a "(.*?)" link$/) do |arg1|
  expect(page).to have_link(arg1)
#  ask('does that look right?')
end

Then(/^I should not see the link "(.*?)"$/) do |arg1|
  expect(page).not_to have_link(arg1)
end

Then(/^I should see a "(.*?)" field$/) do |arg1|
  expect(page).to have_field(arg1)
end

Then(/^I should see the message contains "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
