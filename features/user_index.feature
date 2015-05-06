@user-index
Feature: User index
  As a logged in user
  You can see a list of all users as well as user-specific information.

  
  Background:
    Given I has signed in
    
#  @javascript
  Scenario: Successfully browse user profile page
    When I click the "Users" link
    Then I should see the message contains "All users"
    And  I should see the message contains "Person"
    And  I should see a "Next" link

